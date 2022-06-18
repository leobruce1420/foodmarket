package com.foodmarket.app.member.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.Util;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	Util util = new Util();
	
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	@PostMapping("/checkLogin")
	public String checkLogin(@RequestParam("mail") String mail, @RequestParam("password") String password, Model m, HttpSession session) {
		String psw = util.encryptString(password);
		
		Member member = memberService.findByMailAndPassword(mail, psw);
		
		Map<String, String> errors = memberService.checkLogin(mail, psw);
		
		m.addAttribute("errors", errors);
		
		if(errors!=null && !errors.isEmpty()) {
			logger.info("登入失敗！ 嘗試登入之信箱：" + mail);
			return "member/login";
		}
		
		session.setAttribute("loginUserId", member.getCustomerId());
		session.setAttribute("loginUserName", member.getCustomerName());
		
		logger.info("會員編號：" + member.getCustomerId() + " 登入成功 ");
		
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUserId");
		session.removeAttribute("loginUserName");
		return "index";
	}

}
