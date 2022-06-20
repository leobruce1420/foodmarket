package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.foodmarket.app.product.dto.ProductDto;
import com.foodmarket.app.product.dto.ProductimageDto;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.product.util.Util;

@Controller
public class WorkProductController {

	@Autowired
	private WorkProductService pmsgService;

	@PostMapping("postProduct")
	public String addMessage(@ModelAttribute("workProduct") ProductDto productDto, Model model) throws IOException {
//		System.out.println("qweqeqweqweweqw");
//		String base64Str=productDto.getProductimgdto();
//		if(!StringUtil.isBlank(path)) {
//			
//		}
//		System.out.println(productDto.getProductimg());
//		Util method = new Util();
//		byte[] imgBytes = productDto.getProductimgdto(method.encoder(imgBytes));
//		productDto.setProductimgdto(method.encoder(imgBytes));
//		System.out.println(method.encoder(imgBytes));
//		pmsgService.insertProduct(imgBytes);
		WorkProduct newpMsg = new WorkProduct();
		WorkProduct lastestpMsg = pmsgService.getLastest();

		model.addAttribute("workProduct", newpMsg);
		model.addAttribute("lastestpMsg", lastestpMsg);
		return "product/addMessage";
	}

	@GetMapping("product/editProduct")
	public String editMessage(@RequestParam("productid") Long productid, Model model) {

		WorkProduct pMsg = pmsgService.findById(productid);

		model.addAttribute("pMsg", pMsg);
		return "product/editMessage";
	}

	@PostMapping("product/editProduct")
	public String postMessage(@ModelAttribute(name = "pMsg") WorkProduct pMsg) {
		pmsgService.insertProduct(pMsg);

		return "redirect:/product/all";
	}

	@GetMapping("product/delete")
	public String deleteMsg(@RequestParam("productid") Long productid) {
		pmsgService.deleteById(productid);
		return "redirect:/product/all";
	}

	@PostMapping("api/postProduct")
	@ResponseBody
	public List<WorkProduct> postMessageApi(@RequestBody ProductDto dto) {
		String newpMsg = dto.getPmessage();

		WorkProduct workMsg = new WorkProduct();
		workMsg.setProductname(newpMsg);
		pmsgService.insertProduct(workMsg);

		Page<WorkProduct> page = pmsgService.findByPage(1);
		List<WorkProduct> content = page.getContent();

		return content;
	}
	//關鍵字查詢
//	@PostMapping("product/queryByName")
//	public String queryNameAll(@RequestParam("productname") String productname, Model m, HttpSession session) {
//
//		
//		List<WorkProduct> products = pmsgService.findByName(productname);
//		m.addAttribute("productname", productname);
//		return "product/viewoneMessages";
//	}
	
//	商品種類查詢
//	@PostMapping("product/category?productcategory=")
//	public String queryNameAll(@RequestParam("productname") String productname, Model m, HttpSession session) {
//
//		
//		List<WorkProduct> products = pmsgService.findByproductcategory(productname);
//		m.addAttribute("productname", productname);
//		return "product/viewoneMessages";
//	}

//	@PostMapping("product/uploadfile")
//	@ResponseBody
//	public String uploadfile(@RequestBody ProductDto idto ) {
//		byte[] imageByte= Base64.decodeBase64(idto);
//	    return null;
//	}

}
