package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestPart;
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
	// 圖片未成功
//	@PostMapping("postProduct")
//	public String addMessage(@RequestParam("imgFile") MultipartFile mf, Model model) throws IOException {
////		System.out.println("qweqeqweqweweqw");
////		String base64Str=productDto.getProductimgdto();
////		if(!StringUtil.isBlank(path)) {
////			
////		}
////		System.out.println(productDto.getProductimg());
//		ProductDto method = new ProductDto();
//		WorkProduct test = new WorkProduct();
//		String producttype = productimgdto.getProductimgdto;
//		byte[] imgBytes = mf.getBytes();
//		System.out.println(imgBytes);
//		String img = method.encoder(imgBytes);
//		System.out.println(method.encoder(imgBytes));
//		test.setProductimg(img);
////		WorkProduct product = pmsgService.insertProduct(imgBytes);
//		WorkProduct newpMsg = new WorkProduct();
//		WorkProduct lastestpMsg = pmsgService.getLastest();
//
//		model.addAttribute("workProduct", newpMsg);
//		model.addAttribute("lastestpMsg", lastestpMsg);
//		return "product/addMessage";
//	}
	// img byte[]
//	@PostMapping("postProduct")
//	public String addNewFirm(@RequestParam String productname, @RequestParam String productcategory,
//							 @RequestParam Integer productprice, @RequestPart MultipartFile productimg,
//							 @RequestParam String imgtype,
//							 @RequestParam String productdesciption,
//							 @RequestParam Integer inventoryquantity,
//							 @RequestParam String takedown,Model m) {
//		WorkProduct newProduct = new WorkProduct();
//
//		String productType = productimg.getContentType();
//
//		System.out.println(productType);
//
//		if(!productType.startsWith("image")) {
//			
//			Map<String, String> errors = new HashMap<String, String>();
//			errors.put("firmLogo", "檔案類型必須為圖片");
//			
//			ProductDto productDto = new ProductDto();
//						
//			m.addAttribute("errors", errors);
//			m.addAttribute("productDto", productDto);
//			return "product/addMessage";
//		}
//
//		newProduct.setProductname(productname);
//		newProduct.setProductcategory(productcategory);
//		newProduct.setProductprice(productprice);
//		newProduct.setImgtype(imgtype);
//		newProduct.setProductdesciption(productdesciption);
//		newProduct.setInventoryquantity(inventoryquantity);
//		newProduct.setTakedown(takedown);
//		try {
//			newProduct.setProductimg(productimg.getBytes());
//		} catch (IOException e) {
//			e.printStackTrace();
//			ProductDto proDto = new ProductDto();
//			m.addAttribute("productDto", proDto);
//			return "product/addMessage";
//		}
//
//		pmsgService.insertProduct(newProduct);
//
//		return "redirect:/product/all";
//	}

	// base64
	@PostMapping("postProduct")
	public String addMessage(HttpServletRequest request,@RequestParam String productname, @RequestParam String productcategory,
			 @RequestParam Integer productprice, @RequestParam("productimg") MultipartFile mf,
			 @RequestParam String imgtype,
			 @RequestParam String productdesciption,
			 @RequestParam Integer inventoryquantity,
			 @RequestParam String takedown,Model m) throws  IOException {
		Util method = new Util();
		try {
//			if (!pmsgService.checkLoginSession(session)) {
//				return "AdminLogin";
//			}

			request.setCharacterEncoding("UTF-8");
			WorkProduct productbean = new WorkProduct();

			productbean.setProductname(productname);
			productbean.setProductcategory(productcategory);
			productbean.setProductprice(productprice);
			productbean.setImgtype(imgtype);
			productbean.setProductdesciption(productdesciption);
			productbean.setInventoryquantity(inventoryquantity);
			productbean.setTakedown(takedown);
			productbean.setImgtype("png");
			productbean.setProductdesciption(productdesciption);
			productbean.setInventoryquantity(inventoryquantity);

			byte[] imgBytes = mf.getBytes();
			productbean.setProductimg(method.encoder(imgBytes));


			pmsgService.insertProduct(productbean);

			WorkProduct Products = pmsgService.insertProduct();
			m.addAttribute("products", Products);
			return "product/addMessage";

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/addMessage";
	}

//	@GetMapping("product/editProduct")
//	public String editMessage(@RequestParam("productid") Long productid, Model model) {
//		Optional<WorkProduct> opmsg = pmsgService.findById(productid);
////		WorkProduct pMsg = pmsgService.findById(productid);
//
//		model.addAttribute("pMsg", opmsg);
//		return "product/editMessage";
//	}

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
	// 關鍵字查詢
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
