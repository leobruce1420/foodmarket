package com.foodmarket.app.member.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.JavaMail;
import com.foodmarket.app.member.util.Util;

@Controller
public class PwdEditController {
	@Autowired
	private MemberServiceInterface memberService;

	Util util = new Util();

	private static final Logger logger = LoggerFactory.getLogger(PwdEditController.class);

	// 導向修改密碼
	@GetMapping("toChangePwd/{id}")
	public String toChangePwd(@PathVariable Long id, HttpSession session) {
		Long sessionUId = (Long) session.getAttribute("loginUserId");

		// 判斷路徑的id跟登入中id是否一致(若不一致轉到首頁)(還想亂來啊
		if (sessionUId.equals(id)) {
			logger.info("會員編號：" + sessionUId + "進入修改密碼");
			return "member/changePwd";
		}
		logger.info("會員編號：" + sessionUId + "嘗試進入 會員編號：" + id + "會員中心");
		return "redirect:/HOME";
	}

	// 檢查舊密碼是否一致
	@PostMapping("/checkPwd")
	public ResponseEntity<String> checkPwd(@RequestBody String pwd) {
		System.out.println(pwd);

		JSONObject ob = new JSONObject(pwd);

		String oldPassword = ob.getString("oldPassword");
		String id = ob.getString("id");

		String encryptPwd = util.encryptString(oldPassword);

		Long userId = Long.parseLong(id);

		Member member = memberService.findById(userId);

		if (encryptPwd.equals(member.getPassword())) {
			logger.info(" 密碼一致 ");
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}

		logger.info(" 密碼不一致 ");
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}

	// 修改密碼，成功後登出回首頁
	@PostMapping("/changePwd")
	public String changePwd(@RequestParam("password") String password, HttpSession session, Model m) {

		String psw = util.encryptString(password);

		if (session.getAttribute("loginUserId") != null) {
			Member rsMember = memberService.findById((Long) session.getAttribute("loginUserId"));
			rsMember.setPassword(psw);
			memberService.updateCustomer(rsMember);
			session.removeAttribute("loginUserId");
			session.removeAttribute("loginUserName");
			logger.info("修改密碼成功! 會員編號：" + rsMember.getCustomerId());
			return "member/pwdok";
		} else {
			logger.info("錯誤，請重新登入");
			m.addAttribute("error", "錯誤，請重新登入");
			return "member/changePwd";
		}
	}

}
