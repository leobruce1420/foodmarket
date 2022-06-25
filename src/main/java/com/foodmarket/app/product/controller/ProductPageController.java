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

	// 首頁
	@GetMapping("/HOME")
	public String welcomePage( @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,Model model) {
		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);

		model.addAttribute("page", page);
		return "index";

	}
	// 好的
//	@GetMapping("/p")
//	public String welcomePage(Model model){
//		model.addAttribute("test", "qweweq");
//		return "index";
//		
//	}

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

	// 測試
//	@GetMapping("/p")
//	public ModelAndView viewProducts(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
//		
//		mav.getModel().put("page", page);
////		mav.setViewName("product/viewMessages");
////		mav.setViewName("index");
//		return mav;
//	}
	// 好的
	@GetMapping("product/all")
	public ModelAndView viewProducts(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
//		mav.setViewName("index");
		return mav;
	}

	// 0622T0024 商品全部查詢
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

	// 種類查詢分頁
//	@GetMapping("product/category")
//	public ModelAndView viewProductcategory(ModelAndView catmav,
//			@RequestParam(name="pageNumber", defaultValue="1")Integer pageNumber) {
//		Page<WorkProduct> page = pmsgService.findByProductcategoryKey(pageNumber);
//		
//		catmav.getModel().put("page", page);
////		catmav.addAttribute("productcategory", productcategory);
////		catmav.getModel().put("pcat", pcat);
//		catmav.setViewName("product/viewcategoryMessages");
//		return catmav;
//	}

//	管理員商品種類查詢分頁 測試
	@GetMapping("product/productcategory")
	public ModelAndView Productcategory(ModelAndView mav,
			@RequestParam(required = false, value = "productcategory")String  productcategory,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<WorkProduct> page = pmsgService.findByProductcategorypage(productcategory, pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
		return mav;

	}

//	消費者商品種類查詢無分頁 跳頁顯示
	@GetMapping("product/category")
	public String viewProductcategory(@RequestParam(required = false, value = "productcategory") String productcategory,
			Model m) {
		List<WorkProduct> workProduct = pmsgService.findByProductcategoryKey(productcategory);

		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productcategory", productcategory);
		return "product/viewcategoryMessages";

	}

//	消費者商品種類查詢無分頁 首頁顯示
//	@GetMapping("/p")
//	public String homeProductcategory(@RequestParam (required=false ,value="productcategory")String productcategory,
//			Model m) {
//		List<WorkProduct> workProduct = pmsgService.findByProductcategoryKey(productcategory);
//		
//		m.addAttribute("workProduct", workProduct);
//		m.addAttribute("productcategory", productcategory);
//		return "index";
//		
//	}

	// 消費者商品查詢名稱不分頁 測試
	@GetMapping("product/productname")
	public String viewProductname(@RequestParam(required = false, value = "productname") String productname, Model m) {
		List<WorkProduct> workProduct = pmsgService.findByName(productname);

		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productname", productname);
		return "product/viewnameMessages";

	}
	//商品查詢名稱分頁
	@GetMapping("product/name")
	public ModelAndView Productname(@RequestParam (required=false ,value="productname")String productname,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			ModelAndView m) {
		Page<WorkProduct> page = pmsgService.findByNamePage(productname,pageNumber);
		
		m.getModel().put("page", page);
		m.setViewName("product/viewnameMessages");
		return m;
		
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
	
	//ID查詢
	@GetMapping("product/productid")
	public String viewProductId(@RequestParam("productid") Long productid, Model m) {
		WorkProduct workProduct = pmsgService.findById(productid);

		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productid", productid);
		return "product/viewproductid";

	}
	
	@GetMapping("product/ajax")
	public String ajaxVersion() {
		return "product/ajax-message";
	}

}
