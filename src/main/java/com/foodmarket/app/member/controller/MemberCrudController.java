package com.foodmarket.app.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;


@Controller
public class MemberCrudController {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberCrudController.class);

//	@GetMapping("/member/delete/{id}")
//	public String delete(@PathVariable Long id) {
//		memberService.deleteById(id);
//		return "index";
//		//return "redirect:/message/all";
//	}
	
//	@PostMapping("/updateCustomer")
//	public String updateCustomer(@ModelAttribute("member")Member member, Model m) {
////		@ModelAttribute("member")Member member
////		Member member = memberService.findById((long) 3);
////		member.setCustomerName("李阿甭");
////		member.setMobile("0919777666");
////		member.setMail("hamham@gmail.com");
////		member.setPassword(util.encryptString("a12345"));
////		member.setBirthday(new Date());
////		member.setGender("female");
//		
//		memberService.insertCustomer(member);	
//		return "index";
//	}
	
//	@GetMapping("/member/findByName/{name}")
//	public String findByNamePageable(@PathVariable String name, @RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		Page<Member> mPage = memberService.findByNamePageable(p, name);
//		m.addAttribute("page", mPage);
//		System.out.println(mPage.getTotalElements());
//		return "index";
//	}
//	
//	@GetMapping("/member/findAll")
//	public String findAllPageable(@RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		Page<Member> mPage = memberService.findAllPageable(p);
//		m.addAttribute("page", mPage);
//		System.out.println(mPage.getTotalElements());
//		return "index";
//	}

}
