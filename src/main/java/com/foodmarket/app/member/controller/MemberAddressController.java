package com.foodmarket.app.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;

@Controller
public class MemberAddressController {

	@Autowired
	private MemberServiceInterface memberService;

	private static final Logger logger = LoggerFactory.getLogger(MemberAddressController.class);

	// 導向常用地址
	@GetMapping("/memberAddress/{id}")
	public String memberAddress(@PathVariable Long id, Model m, HttpSession session, @ModelAttribute("editOkMsg") String message) {
		Long sessionUId = (Long) session.getAttribute("loginUserId");

		// 判斷路徑的id跟登入中id是否一致(若不一致轉到首頁)(還想亂來啊
		if (sessionUId.equals(id)) {
			Member member = memberService.findById(id);
			m.addAttribute("member", member);
			m.addAttribute("editOkMsg", message);
			logger.info("會員編號：" + member.getCustomerId() + "進入常用地址");
			return "member/memberAddress";
		}
		logger.info("會員編號：" + sessionUId + "嘗試進入 會員編號：" + id + "常用地址");
		return "index";
	}

	@PostMapping("/editAddress")
	public String editAddress(@RequestParam(name="add1" ,required=false) String add1, @RequestParam(name="add2" ,required=false) String add2,
			@RequestParam(name="add3" ,required=false) String add3, HttpSession session, RedirectAttributes redirectAttributes) {
		Long sessionUId = (Long) session.getAttribute("loginUserId");
		
		Member member = memberService.findById(sessionUId);
		
		//判斷是否有傳資料，無則清空該欄位
		if(!add1.trim().isBlank()) {
			member.setAdress1(add1);
		}else {
			member.setAdress1(null);
		}
		
		if(!add2.trim().isBlank()) {
			member.setAdress2(add2);
		}else {
			member.setAdress2(null);
		}
		
		if(!add3.trim().isBlank()) {
			member.setAdress3(add3);
		}else {
			member.setAdress3(null);
		}
		
		Member rsMember = memberService.updateCustomer(member);
		
		redirectAttributes.addFlashAttribute("editOkMsg", "修改成功");
		
		return "redirect:/memberAddress/" + rsMember.getCustomerId();
	}

}
