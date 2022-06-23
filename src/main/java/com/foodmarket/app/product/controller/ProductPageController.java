package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.product.util.Util;


@Controller
public class ProductPageController {
	
	@Autowired
	private WorkProductService pmsgService;
	
	@GetMapping("/p")
	public String welcomePage(Model model){
		model.addAttribute("test", "qweweq");
		return "index";
		
	}
	
	@GetMapping("product/add")
	public String addMessagePage(Model model) {
//		Util method = new Util();
		WorkProduct workProduct = new WorkProduct();
		WorkProduct lastestpMsg = pmsgService.getLastest();
//		byte[] imgBytes = mf.getBytes();
//		workProduct.setProductimg(method.decoder(imgBytes));
		model.addAttribute("workProduct", workProduct);
		model.addAttribute("lastestpMsg", lastestpMsg);
		
		
		return "product/addMessage";
	}
	
	@GetMapping("product/all")
	public ModelAndView viewProducts(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
//		mav.setViewName("index");
		return mav;
	}
	
	
	//0622T0024 商品全部查詢
//	@GetMapping("product/allproduct")
//	public ModelAndView  viewAllProducts(ModelAndView mav, 
//			@RequestParam(name="to", defaultValue = "1") Integer productNumber) {
//		List<WorkProduct> allpro = pmsgService.selectAll();
//		
//		mav.getModel().put("allpro", allpro);
//		mav.setViewName("product/viewMessages");
////		mav.setViewName("index");
//		return mav;
//	}
	
	//種類查詢
	@GetMapping("product/category")
	public String viewProductcategory(ModelAndView catmav,@RequestParam(value="productcategory") String productcategory, @RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		System.out.println("qweqweqweqwe");
		System.out.println(productcategory);
//		System.out.println(productcate);
		Page<WorkProduct> pcat = pmsgService.findByProductcategoryKey(p, productcategory);
		
		m.addAttribute("pcat", pcat);
		m.addAttribute("productcategory", productcategory);
//		catmav.getModel().put("pcat", pcat);
//		catmav.setViewName("product/viewcategoryMessages");
		return "product/viewcategoryMessages";
	}
	
//	管理員商品查詢分頁
//	@GetMapping("product/{name}")
//	public String viewProductname(@RequestParam (value="productname")String productname,
//			@RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		Page<WorkProduct> pname = pmsgService.findByName(p, productname);
//		
//		m.addAttribute("pname", pname);
//		m.addAttribute("productname", productname);
//		System.out.println(pname.getTotalElements());
//		return "product/viewnameMessages";
//	
//	}
	
	//管理員商品查詢不分頁
	@GetMapping("product/name")
	public String viewProductname(@RequestParam (required=false ,value="name")String productname,
			 Model m) {
		List<WorkProduct> pname = pmsgService.findByName(productname);
		
		m.addAttribute("pname", pname);
		m.addAttribute("productname", productname);
//		System.out.println(pname.getTotalElements());
		return "product/viewnameMessages";
		
	}
	
//	消費者
//	@GetMapping("product/name")
//	public String viewProductname(@RequestParam (value="productname")String productname, @RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		Page<WorkProduct> pname = pmsgService.findByName(p, productname);
//		
//		m.addAttribute("page", pname);
//		System.out.println(pname.getTotalElements());
//		return "product/viewoneMessages";
//		
//	}
	@GetMapping("product/ajax")
	public String ajaxVersion() {
		return "product/ajax-message";
	}
	
	
	
	

}
