package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	//0621T0000
//	@GetMapping("firm/{id}/productimg")
//	public ResponseEntity<byte[]> getProductimg(@PathVariable("productid") Long productid) {
//		Optional<WorkProduct> productBean = pmsgService.findById(productid);
//
//		byte[] productimg = productBean.get().getProductimg();
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_JPEG);
//
//		return new ResponseEntity<byte[]>(productimg, headers, HttpStatus.OK);
//	}
	
	@GetMapping("product/all")
	public ModelAndView viewProducts(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
		return mav;
	}
	@GetMapping("product/category")
	public String viewProductcategory(ModelAndView catmav,@RequestParam(value="productcategory") String productcategory, @RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
//		System.out.println("qweqweqweqwe");
		System.out.println(productcategory);
//		System.out.println(productcate);
		Page<WorkProduct> pcat = pmsgService.findByProductcategoryKey(p, productcategory);
		
		m.addAttribute("pcat", pcat);
		m.addAttribute("productcategory", productcategory);
//		catmav.getModel().put("pcat", pcat);
//		catmav.setViewName("product/viewoneMessages");
		return "product/viewoneMessages";
	}
	@GetMapping("product/name")
	public String viewProductname(@RequestParam (value="productname")String productname, @RequestParam(value="pageNumber", defaultValue="1")Integer p, Model m) {
		Page<WorkProduct> page = pmsgService.findByName(p, productname);
		
		m.addAttribute("page", page);
		System.out.println(page.getTotalElements());
		return "product/viewoneMessages";
	
	}
	@GetMapping("product/ajax")
	public String ajaxVersion() {
		return "product/ajax-message";
	}
	
	
	
	

}
