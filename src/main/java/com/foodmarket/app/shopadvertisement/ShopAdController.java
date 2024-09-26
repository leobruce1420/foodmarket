package com.foodmarket.app.shopadvertisement;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.blogadvertisement.Base64Method;
import com.foodmarket.app.blogadvertisement.BlogAdvertisement;


@Controller
public class ShopAdController {
	@Autowired
	private ShopAdService sService;
	
	Base64Method base = new Base64Method();
	
	@GetMapping("/shopad/insert")
	public String insertAd(Model m) {
		
		ShopAdvertisement ad = new ShopAdvertisement();
		
		m.addAttribute("ad",ad);
		
		return "advertisement/insertShopAd";
	}
	
	@GetMapping("/shopad/getAll")
	public String showAllAd(Model m) {
		
		List<ShopAdvertisement> ad = sService.getAllAdsById();
		
		m.addAttribute("ad",ad);
		
		return "advertisement/getAllShopAd";
	}
	
	@GetMapping("/shopad/queryById")
	public String queryById(@RequestParam("id") Integer id, Model m) {
		
		ShopAdvertisement ad = sService.findById(id);
		if(ad!=null) {
			m.addAttribute("ad", ad);
		return "advertisement/getShopAd";
		}
		return "advertisement/noMessage";
	}
	
	@GetMapping("/shopad/update")
	public String UpdateAd(@RequestParam("id") Integer id, Model m) {
		ShopAdvertisement ad = sService.findById(id);
		m.addAttribute("ad", ad);
		return "advertisement/updateShopAd";
	}
	
//  跟主頁合併
//	@GetMapping("/shopad/upload")
//	public String uploadBoard(Model m) {
//		List<ShopAdvertisement> ad = sService.findByBoard();
//		m.addAttribute("ad",ad);
//		return "index"; 
//	}
	
//	@GetMapping("/shopad/getAll")
//	public ModelAndView viewMessages(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<ShopAdvertisement> page = sService.findByPage(pageNumber);
//		mav.getModel().put("page", page);
//		mav.setViewName("advertisement/getAllShopAd");
//		return mav;
//	}
	
	////////////////////////////
	
	@PostMapping("/shopad/insert")
	public String insertAd(@RequestParam("shopAdName") String shopAdName,
			@RequestParam("picture") MultipartFile picture,
			@RequestParam("beginDate") String beginDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("remark") String remark,
			@RequestParam("productId") String productId,
			@RequestParam("shopUrl") String shopUrl,
			@RequestParam("onboard") String onboard,
			Model m) throws IOException {
		ShopAdvertisement bBean = new ShopAdvertisement();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date bDate = null;
		Date eDate = null;
		
		bBean.setShopAdName(shopAdName);
		
		byte[] imgByte = picture.getBytes();
		bBean.setPicture(base.encoder(imgByte));
		
		//處理date型別
		try {
			bDate = new Date(dateFormat.parse(beginDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setBeginDate(bDate);
		
		
		//處理date型別
		try {
			eDate = new Date(dateFormat.parse(endDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		bBean.setEndDate(eDate);
	
		bBean.setRemark(remark);
		
		
		if(!productId.isEmpty()) {
			bBean.setProductId(productId);
		}
	
		
		bBean.setShopUrl(shopUrl);
		
		bBean.setOnboard(onboard);
		
		sService.insertAd(bBean);
		
		List<ShopAdvertisement> ads = sService.getAllAds();
		
		m.addAttribute("ads",ads);
		
		return"redirect:/shopad/getAll";	
	}
	
	@PostMapping("/shopad/update")
	public String updateAd(@RequestParam("shopAdId") Integer shopAdId,
			@RequestParam("shopAdName") String shopAdName,
			@RequestParam("picture") MultipartFile picture,
			@RequestParam("beginDate") String beginDate,
			@RequestParam("endDate") String endDate,
			@RequestParam("remark") String remark,
			@RequestParam("productId") String productId,
			@RequestParam("shopUrl") String shopUrl,
			@RequestParam("onboard") String onboard,
			Model m) throws IOException {
		ShopAdvertisement bBean = sService.findById(shopAdId);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date cDate = null;
		Date eDate = null;
		
		bBean.setShopAdName(shopAdName);
		
		if(!picture.isEmpty()) {
			byte[] imgByte = picture.getBytes();
			bBean.setPicture(base.encoder(imgByte));
		}
		
			
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
		
		bBean.setProductId(productId);
		
		bBean.setShopUrl(shopUrl);
		
		bBean.setOnboard(onboard);
		
		sService.insertAd(bBean);
		
		List<ShopAdvertisement> ad = sService.getAllAds();
		
		m.addAttribute("ad",ad);
		
		return"redirect:/shopad/getAll";	
	}
	
	@GetMapping("/shopad/delete")
	public String delete(@RequestParam("id") Integer id) {
		sService.deleteById(id);
		return "redirect:/shopad/getAll";
	}
	
	
	
}

