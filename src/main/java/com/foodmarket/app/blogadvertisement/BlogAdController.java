package com.foodmarket.app.blogadvertisement;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BlogAdController {

	@Autowired
	private BlogAdService bService;
	
	Base64Method base = new Base64Method();
	
	@GetMapping("/blogad/insert")
	public String insertAd(Model m) {
		
		BlogAdvertisement ad = new BlogAdvertisement();
		
		m.addAttribute("ad",ad);
		
		return "advertisement/insertBlogAd";
	}
	
	@GetMapping("/blogad/getAll")
	public String showAllAd(Model m) {
		
		List<BlogAdvertisement> ad = bService.getAllAds();
		
		m.addAttribute("ad",ad);
		
		return "advertisement/getAllBlogAd";
	}
	
	@GetMapping("/blogad/queryById")
	public String queryById(@RequestParam("id") Integer id, Model m) {
		
		BlogAdvertisement ad = bService.findById(id);
		
		m.addAttribute("ad", ad);
		return "advertisement/getBlogAd";
	}
	
	@GetMapping("/blogad/update")
	public String UpdateAd(@RequestParam("id") Integer id, Model m) {
		BlogAdvertisement ad = bService.findById(id);
		m.addAttribute("ad", ad);
		return "advertisement/updateBlogAd";
	}
	
	///////////////////////////////////////////
	
	@PostMapping("/blogad/insert")
	public String insertAd(@RequestParam("blogAdName") String blogAdName,
			@RequestParam("picture") MultipartFile picture,
			@RequestParam("beginDate") String beginDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("remark") String remark,
			@RequestParam("recipeId") String recipeId,
			Model m) throws IOException {
		BlogAdvertisement bBean = new BlogAdvertisement();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date cDate = null;
		Date eDate = null;
		
		bBean.setBlogAdName(blogAdName);
		
		byte[] imgByte = picture.getBytes();
		bBean.setPicture(base.encoder(imgByte));
		
		//處理date型別
		try {
			cDate = new Date(dateFormat.parse(beginDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setBeginDate(cDate);
		
		
		//處理date型別
		try {
			eDate = new Date(dateFormat.parse(endDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setEndDate(eDate);
	
		bBean.setRemark(remark);
		
		bBean.setRecipeId(recipeId);
		
		bService.insertAd(bBean);
		
		List<BlogAdvertisement> ad = bService.getAllAds();
		
		m.addAttribute("ad",ad);
		
		return"redirect:/blogad/getAll";	
	}
	
	@PostMapping("/blogad/update")
	public String updateAd(@RequestParam("blogAdId") Integer blogAdId,
			@RequestParam("blogAdName") String blogAdName,
			//@RequestParam("picture") MultipartFile picture,
			@RequestParam("beginDate") String beginDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("remark") String remark,
			@RequestParam("recipeId") String recipeId,
			Model m) throws IOException {
		BlogAdvertisement bBean = bService.findById(blogAdId);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date cDate = null;
		Date eDate = null;
		
		bBean.setBlogAdName(blogAdName);
		
		//byte[] imgByte = picture.getBytes();
		//bBean.setPicture(base.encoder(imgByte));
		
		//處理date型別
		try {
			cDate = new Date(dateFormat.parse(beginDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setBeginDate(cDate);
		
		
		//處理date型別
		try {
			eDate = new Date(dateFormat.parse(endDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setEndDate(eDate);
	
		bBean.setRemark(remark);
		
		bBean.setRecipeId(recipeId);
		
		bService.insertAd(bBean);
		
		List<BlogAdvertisement> ad = bService.getAllAds();
		
		m.addAttribute("ad",ad);
		
		return"redirect:/blogad/getAll";	
	}
	
	@GetMapping("/blogad/delete")
	public String delete(@RequestParam("id") Integer id) {
		bService.deleteById(id);
		return "redirect:/blogad/getAll";
	}
}
