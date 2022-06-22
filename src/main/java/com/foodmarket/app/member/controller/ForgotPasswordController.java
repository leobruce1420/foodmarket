package com.foodmarket.app.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.JavaMail;
import com.foodmarket.app.member.util.Util;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	Util util = new Util();

	JavaMail mail = new JavaMail();

	private static final Logger logger = LoggerFactory.getLogger(ForgotPasswordController.class);
	
	//導向忘記密碼輸入信箱頁面
	@GetMapping("/toforgotPwd")
	public String forgotPwd() {
		return "member/forgotPwd/forgotPwd";
	}
	
	//寄信&修改DB欄位並導向發信成功頁面
	@PostMapping("/pwdMail")
	public String pwdMail(@RequestParam("mail") String email, Model m) {

		Member rsMember = memberService.findByMail(email);

		if (rsMember != null) {
			String token = util.encodeSha512(rsMember.getPassword().toString());

			// 信件標題及內容設定
			String title = "foodmarket忘記密碼驗證信";
			String text = "您好，請點擊下方連結修改密碼<br>" + "<a href = 'http://localhost:8080/foodmarket/pswMailCheck/" + token
					+ "'>" + "http://localhost:8080/foodmarket/pswMailCheck/" + token + "</a><br>"+
					"本連結只能使用一次";

			// 在db新增authToken及到期日
			rsMember.setChangePasswordToken(token);

			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MINUTE, +30);
			rsMember.setChangePasswordLimit(cal.getTime());

			memberService.updateCustomer(rsMember);

			mail.SendMail(email, title, text);

			return "member/forgotPwd/pwdMail";

		} else {
			logger.info("無此帳號!");
			m.addAttribute("error", "無此帳號!");
			return "member/forgotPwd/forgotPwd";
		}
	}
	
	//檢查信件中url帶的token，若成功則清空驗證欄位、導向修改密碼頁面(忘記密碼版)
	@GetMapping("/pswMailCheck/{token}")
	public String pswMailCheck(@PathVariable String token, Model m, HttpSession session) {
		Member rsMember = memberService.findByChangePasswordToken(token);

		if (rsMember != null) {
			if (rsMember.getChangePasswordLimit().after(new Date())) {
				logger.info("忘記密碼驗證成功! 會員編號：" + rsMember.getCustomerId());
				rsMember.setChangePasswordLimit(null);
				rsMember.setChangePasswordToken(null);
				memberService.updateCustomer(rsMember);
				session.setAttribute("changePwdUserId", rsMember.getCustomerId());
				return "member/forgotPwd/changePwdBytoken";
			} else {
				logger.info("驗證碼過期! 會員編號：" + rsMember.getCustomerId());
				m.addAttribute("error", "驗證碼過期!");
				return "member/forgotPwd/forgotPwd";
			}
		} else {
			logger.info("無此token或重複使用");
			return "index";
		}
	}
	
	//接修改密碼頁面(忘記密碼版)的資料並修改密碼
	@PostMapping("/changePwdByToken")
	public String changePwd(@RequestParam("password") String password, HttpSession session, Model m) {
		
		String psw = util.encryptString(password);
		
		if(session.getAttribute("changePwdUserId") != null) {
			Member rsMember = memberService.findById((Long) session.getAttribute("changePwdUserId"));		
			rsMember.setPassword(psw);
			session.setAttribute("changePwdUserId", null);
			memberService.updateCustomer(rsMember);
			logger.info("修改密碼成功! 會員編號：" + rsMember.getCustomerId());
			return "member/forgotPwd/pwdMailCheck";
		}else {
			logger.info("錯誤，請重新發送驗證信");
			m.addAttribute("error", "錯誤，請重新發送驗證信");
			return "member/forgotPwd/forgotPwd";
		}
	}

}
