package com.foodmarket.app.member.controller;

import java.io.IOException;
import java.util.Date;

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
import org.springframework.web.multipart.MultipartFile;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.member.util.Util;

@Controller
public class MemberEditController {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	Util util = new Util();

	private static final Logger logger = LoggerFactory.getLogger(MemberEditController.class);
	
	//導向會員中心首頁
	@GetMapping("/memberCenter/{id}")
	public String memberCenter(@PathVariable Long id, Model m, HttpSession session) {
		
		Long sessionUId = (Long) session.getAttribute("loginUserId");
		
		//判斷路徑的id跟登入中id是否一致(若不一致轉到首頁)(還想亂來啊
		if(sessionUId.equals(id)) {
			Member member = memberService.findById(id);		
			m.addAttribute("member", member);
			logger.info("會員編號：" + member.getCustomerId() + "進入會員中心");
			return "member/memberCenter";	
		}
		logger.info("會員編號：" + sessionUId + "嘗試進入 會員編號："+ id + "會員中心");
		return "index";	
	}
	
	//修改會員資料
	@PostMapping("/updateCustomer")
	public String updateCustomer(@ModelAttribute("member") Member member, @RequestParam(name="img" ,required=false) MultipartFile mf, Model m, HttpSession session) throws IOException {

		Member datamember = memberService.findById(member.getCustomerId());
		String pwd = datamember.getPassword();
		member.setPassword(pwd);
				
		//修改時間
		member.setModifiedDate(new Date());
		
		
		if(!mf.isEmpty()) {
			String imgType = mf.getOriginalFilename().substring(mf.getOriginalFilename().indexOf(".")+1); 
			if(imgType.equals("png")) {
				member.setImgType(imgType);
			}else {
				member.setImgType("jpeg");
			}
			
			byte[] imgBytes = mf.getBytes();
			String file = util.encoder(imgBytes);
			member.setImgFile(file);
		}else {
			member.setImgType(datamember.getImgType());
			member.setImgFile(datamember.getImgFile());
		}
		
		
		Member rsMember = memberService.updateCustomer(member);
		logger.info("修改成功! 會員編號：" + rsMember.getCustomerId());
		
//		Member resMember = memberService.findById(rsMember.getCustomerId());		
//		m.addAttribute("member", resMember);
//		
//		return "member/memberCenter";
		
		return "redirect:/memberCenter/" + rsMember.getCustomerId();	
	}

}
