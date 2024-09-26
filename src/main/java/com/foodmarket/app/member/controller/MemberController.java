package com.foodmarket.app.member.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.JavaMail;
import com.foodmarket.app.member.util.Util;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceInterface memberService;

	Util util = new Util();

	JavaMail mail = new JavaMail();

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// ===============================登入登出==============================================================================================

	@PostMapping("/checkLogin")
	public String checkLogin(@RequestParam("mail") String mail, @RequestParam("password") String password, Model m,
			HttpSession session) {
		String psw = util.encryptString(password);

		Member member = memberService.findByMailAndPassword(mail, psw);

		Map<String, String> errors = memberService.checkLogin(mail, psw);

		m.addAttribute("errors", errors);

		if (errors != null && !errors.isEmpty()) {
			logger.info("登入失敗！ 嘗試登入之信箱：" + mail);
			return "member/login";
		}

		session.setAttribute("loginUserId", member.getCustomerId());
		session.setAttribute("loginUserName", member.getCustomerName());

		logger.info("會員編號：" + member.getCustomerId() + " 登入成功 ");

		return "redirect:/HOME";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUserId");
		session.removeAttribute("loginUserName");
		return "redirect:/HOME";
	}

	// ===============================機器人驗證==============================================================================================

	@PostMapping("/checkRecaptcha")
	public ResponseEntity<String> checkRecaptcha(@RequestBody String token) {

		String secret = "6Le9B3QgAAAAAACgXADsbBwEbHNOCdMHd0KPz0aS";

		if (util.isCaptchaValid(secret, token.replace("\"", ""))) {
			logger.info(" 人機驗證成功 ");
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}

		logger.info(" 人機驗證失敗 ");
		return new ResponseEntity<String>("N", HttpStatus.OK);

	}

	// ===============================檢查信箱==============================================================================================

	@PostMapping("/checkMail")
	public ResponseEntity<String> checkMail(@RequestBody String mail) {
		if (memberService.findByMail(mail) != null) {
			logger.info(" 帳號已存在 ");
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}

		logger.info(" 帳號沒有重複 ");
		return new ResponseEntity<String>("N", HttpStatus.OK);

	}
	
	@PostMapping("/checkYourMail")
	public ResponseEntity<String> checkYourMail(@RequestBody String mail, HttpSession session) {
		Long sessionUId = (Long) session.getAttribute("loginUserId");
		Member loginMember = memberService.findById(sessionUId);
		Member inputMember = memberService.findByMail(mail);
		
			
		if (inputMember != null) {
			if(loginMember.getMail().equals(inputMember.getMail())) {
				logger.info(" 帳號已存在且一致 ");
				return new ResponseEntity<String>("Y", HttpStatus.OK);
			}
			logger.info(" 帳號已存在但不一致 ");
			return new ResponseEntity<String>("N", HttpStatus.OK);
		}

		logger.info(" 帳號沒有重複 ");
		return new ResponseEntity<String>("N", HttpStatus.OK);

	}

	// ===============================註冊(韓信箱驗證)==============================================================================================

	
	@GetMapping("/signUp")
	public String signUp(Model m) {
		Member member = new Member();
		m.addAttribute("member", member);
		return "member/signUp";
	}
	
	// 新增會員並發信
	@PostMapping("/insertCustomer")
	public String insertCustomer(@ModelAttribute("member") Member member, Model m, HttpSession session) {
		Member rsMember = memberService.insertCustomer(member);
		logger.info("註冊成功! 會員編號：" + rsMember.getCustomerId());

		String token = util.encodeSha512(rsMember.getCustomerId().toString());

		// 信件標題及內容設定
		String title = "foodmarket會員驗證信";
		String text = "您好，請點擊下方連結啟動完整會員功能<br>" + "<a href = 'http://localhost:8080/foodmarket/authMailCheck/" + token
				+ "'>" + "http://localhost:8080/foodmarket/authMailCheck/" + token + "</a>";
//		// 轉為登入狀態
//		session.setAttribute("loginUserId", rsMember.getCustomerId());
//		session.setAttribute("loginUserName", rsMember.getCustomerName());

		// 在db新增authToken及到期日
		rsMember.setAuthToken(token);

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +3);
//		cal.add(Calendar.SECOND, +3); 
		rsMember.setAuthLimit(cal.getTime());

		memberService.updateCustomer(rsMember);

		mail.SendMail(rsMember.getMail(), title, text);

		return "member/auth/authMail";
	}

	@GetMapping("/authMailCheck/{token}")
	public String authMailCheck(@PathVariable String token, HttpSession session) {
		Member rsMember = memberService.findByAuthToken(token);

		if (rsMember != null) {
			if (rsMember.getAuthCheck().equals("false")) {

				if (rsMember.getAuthLimit().after(new Date())) {
					logger.info("驗證成功! 會員編號：" + rsMember.getCustomerId());
					rsMember.setAuthCheck("true");
					rsMember.setAuthToken(null);
					rsMember.setAuthLimit(null);
					memberService.updateCustomer(rsMember);
					return "member/auth/authMailCheck";
				} else {
					logger.info("錯誤驗證碼! 會員編號：" + rsMember.getCustomerId());
					return "member/auth/authMailReSend";
				}
			} else {
				logger.info("重複驗證! 會員編號：" + rsMember.getCustomerId());
				return "redirect:/HOME";
			}
		} else {
			logger.info("無此會員或重複驗證");
			return "redirect:/HOME";
		}

	}
	
	@GetMapping("/reSendAuth")
	public String reSendAuth() {
		return "member/auth/authMailReSend";
	}

	@PostMapping("/authMailReSend")
	public String authMailReSend(@RequestParam("mail") String email, Model m) {

		Member rsMember = memberService.findByMail(email);

		if (rsMember != null) {
			if (rsMember.getAuthCheck().equals("false")) {
				String token = util.encodeSha512(rsMember.getCustomerId().toString());

				// 信件標題及內容設定
				String title = "foodmarket會員驗證信";
				String text = "您好，請點擊下方連結啟動完整會員功能<br>" + "<a href = 'http://localhost:8080/foodmarket/authMailCheck/"
						+ token + "'>" + "http://localhost:8080/foodmarket/authMailCheck/" + token + "</a>";

				// 在db新增authToken及到期日
				rsMember.setAuthToken(token);

				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE, +3);
				rsMember.setAuthLimit(cal.getTime());

				memberService.updateCustomer(rsMember);

				mail.SendMail(email, title, text);

				return "member/auth/authMail";
			} else {
				logger.info("驗證過的帳號!");
				m.addAttribute("error", "驗證過的帳號!");
				return "member/auth/authMailReSend";
			}
		} else {
			logger.info("無此帳號!");
			m.addAttribute("error", "無此帳號!");
			return "member/auth/authMailReSend";
		}
	}

}
