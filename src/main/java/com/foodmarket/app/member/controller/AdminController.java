package com.foodmarket.app.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.member.model.Admin;
import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.AdninServiceInterface;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.JavaMail;
import com.foodmarket.app.member.util.Util;


@Controller
public class AdminController {
	
		@Autowired
		private AdninServiceInterface adminService;
		
		@Autowired
		private MemberServiceInterface memberService;

		Util util = new Util();

		JavaMail mail = new JavaMail();
		
		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// ===============================登入登出==============================================================================================

		@PostMapping("/adminCheckLogin")
		public String adminCheckLogin(@RequestParam("account") String account, @RequestParam("password") String password, Model m,
				HttpSession session) {
			logger.info("test");
			
			String psw = util.encryptString(password);
			
			Admin admin = adminService.findByNameAndPassword(account, psw);

			Map<String, String> errors = adminService.checkLogin(account, psw);

			m.addAttribute("errors", errors);

			if (errors != null && !errors.isEmpty()) {
				logger.info("登入失敗！ 嘗試登入之管理員：" + account);
				return "member/adminLogin";
			}

			session.setAttribute("loginAdminId", admin.getId());
			session.setAttribute("loginAdminName", admin.getName());

			logger.info("管理員編號：" + admin.getId() + " 登入成功 ");

			return "adminIndex";
		}

		@GetMapping("/adminLogout")
		public String logout(HttpSession session) {
			session.removeAttribute("loginAdminId");
			session.removeAttribute("loginAdminName");
			return "member/adminLogin";
		}
		
		// ===============================秀資料==============================================================================================
		
		@GetMapping("/member/findAll")
		public String findAllPageable(@RequestParam(name="p", defaultValue="1")Integer p, Model m) {
			Page<Member> mPage = memberService.findAllPageable(p);
			m.addAttribute("page", mPage);
			System.out.println(mPage.getTotalElements());
			return "member/viewMember";
		}
		
		@PostMapping("/member/delete")
		public String deleteById(@RequestParam("id") int id, Model m,HttpSession session) {
			
			try {
				logger.info("test");
				Member member = memberService.findById((long) id);
				if(member!=null) {
					memberService.deleteById((long) id);
				}
				
				return "redirect:/member/findAll";
				
			}catch(Exception e) {
				e.printStackTrace();
				return "redirect:/member/findAll";
			}
		}

}
