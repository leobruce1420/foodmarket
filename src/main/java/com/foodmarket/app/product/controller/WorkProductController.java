package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.productcategoryBean;
import com.foodmarket.app.product.service.ProductcategoryService;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.product.util.Util;

@Controller
public class WorkProductController {

	@Autowired
	private WorkProductService pmsgService;
	
	@Autowired
	private ProductcategoryService pcmsgService;
	
	//
	
	
//0704==============================================
	// 新增商品 join
	@PostMapping("postProduct")
	public String addMessage(@RequestParam("productname") String productname, 
			@RequestParam("productcategory")  String productcategory,
			 @RequestParam("productprice") Integer productprice,
			 @RequestParam("productimg") MultipartFile mf,
			 @RequestParam("productdesciption") String productdesciption,
			 @RequestParam("administrator") String administrator,
			 @RequestParam("inventoryquantity") Integer inventoryquantity,
			 @RequestParam("takedown") String takedown,
//			 @RequestParam("productcategoryid") Integer productcategoryid,
			 @RequestParam(required = false, value = "takeon") String takeon,
			 Model m) throws  IOException {
		Util method = new Util();
		
		try {
//			if (!pmsgService.checkLoginSession(session)) {
//				return "AdminLogin";
//			}

//			request.setCharacterEncoding("UTF-8");
			WorkProduct workProduct = new WorkProduct();
//			productcategoryBean productcategoryBean = pcmsgService.findById(productcategoryid);
//			productcategoryBean cateB = pcmsgService.findById(categoryid);
//			productcategoryBean productcategoryBean = new productcategoryBean();
			workProduct.setProductname(productname);
			workProduct.setProductcategory(productcategory);
			workProduct.setProductprice(productprice);
			workProduct.setAdministrator(administrator);
			workProduct.setProductdesciption(productdesciption);
			workProduct.setInventoryquantity(inventoryquantity);
			workProduct.setTakedown(takedown);
			workProduct.setProductdesciption(productdesciption);
			workProduct.setInventoryquantity(inventoryquantity);
//			workProduct.setProductcategoryid(productcategoryid);
//			workProduct.setProductcategoryBean(productcategoryBean);
//			workProduct.setProductcategoryBean(cateB);

			byte[] imgBytes = mf.getBytes();
			workProduct.setProductimg(method.encoder(imgBytes));


			pmsgService.insertProduct(workProduct);
			WorkProduct newpMsg = new WorkProduct();
			WorkProduct lastestpMsg = pmsgService.getLastest();
//			List<productcategoryBean> lastestpcMsg = pcmsgService.getList();
			List<WorkProduct> Products = pmsgService.selectAll();
			List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
			
			System.out.println(pcmsgService.findByProductCategoryTakeon(takeon));
			m.addAttribute("productcategorytakeon", productcategorytakeon);
			System.out.println(productcategorytakeon);
			m.addAttribute("workProduct", newpMsg);
			m.addAttribute("products", Products);
			m.addAttribute("lastestpMsg", lastestpMsg);
//			m.addAttribute("lastestpcMsg", lastestpcMsg);
			//0705T1900=====================================
//			productcategoryBean cateB = pcmsgService.findById(categoryid);
//			WorkProduct pro = new WorkProduct();
//			pro.setProductcategoryBean(cateB);
			//================================
			return "product/addMessage";

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product/addMessage";
	}
	
	//=================================================================
	 //新增商品
//		@PostMapping("postProduct")
//		public String addMessage(@RequestParam("productname") String productname, 
//				@RequestParam("productcategory")  String productcategory,
//				 @RequestParam("productprice") Integer productprice,
//				 @RequestParam("productimg") MultipartFile mf,
//				 @RequestParam("productdesciption") String productdesciption,
//				 @RequestParam("administrator") String administrator,
//				 @RequestParam("inventoryquantity") Integer inventoryquantity,
//				 @RequestParam("takedown") String takedown,
//			  // @RequestParam("productcategoryId") Integer productcategoryId,
//	             Model m) throws  IOException {
//			Util method = new Util();
//			
//			try {
////				if (!pmsgService.checkLoginSession(session)) {
////					return "AdminLogin";
////				}
//
////				request.setCharacterEncoding("UTF-8");
//				WorkProduct workProduct = new WorkProduct();
//
//				workProduct.setProductname(productname);
//				workProduct.setProductcategory(productcategory);
//				workProduct.setProductprice(productprice);
//				workProduct.setAdministrator(administrator);
//				workProduct.setProductdesciption(productdesciption);
//				workProduct.setInventoryquantity(inventoryquantity);
//				workProduct.setTakedown(takedown);
//				workProduct.setProductdesciption(productdesciption);
//				workProduct.setInventoryquantity(inventoryquantity);
////				workProduct.setInventoryquantity(productcategoryId);
//
//				byte[] imgBytes = mf.getBytes();
//				workProduct.setProductimg(method.encoder(imgBytes));
//
//
//				pmsgService.insertProduct(workProduct);
//				WorkProduct newpMsg = new WorkProduct();
//				WorkProduct lastestpMsg = pmsgService.getLastest();
//				List<WorkProduct> Products = pmsgService.selectAll();
//				m.addAttribute("workProduct", newpMsg);
//				m.addAttribute("products", Products);
//				m.addAttribute("lastestpMsg", lastestpMsg);
//				return "product/addMessage";
//
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			return "product/addMessage";
//		}
	//========================================================
//  join
	@GetMapping("product/editProduct")
	public String editMessage(@RequestParam("productid") Long productid,
			@RequestParam(required = false, value = "takeon") String takeon,
			Model model) {
//		Optional<WorkProduct> opmsg = pmsgService.findById(productid);
		WorkProduct pMsg = pmsgService.findById(productid);
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		model.addAttribute("productcategorytakeon", productcategorytakeon);
		model.addAttribute("pMsg", pMsg);
		return "product/editMessage";
	}
	//join
	@PostMapping("product/editProduct")
	public String postMessage(@RequestParam("productid") Long productid, 
			@RequestParam("productname") String productname, 
			@RequestParam("productcategory")  String productcategory,
			 @RequestParam("productprice") Integer productprice,
			 @RequestParam("productimg") MultipartFile mf,
			 @RequestParam("productdesciption") String productdesciption,
			 @RequestParam("administrator") String administrator,
			 @RequestParam("inventoryquantity") Integer inventoryquantity,
			 @RequestParam("takedown") String takedown,
			 @RequestParam("productcategoryid") Integer productcategoryid,
			 @RequestParam(required = false, value = "takeon") String takeon,
			 Model m) throws IOException {
		WorkProduct workProduct = pmsgService.findById(productid);
		Util method = new Util();
//		WorkProduct newworkProduct = new WorkProduct();

		workProduct.setProductname(productname);
		workProduct.setProductcategory(productcategory);
		workProduct.setProductprice(productprice);
		workProduct.setAdministrator(administrator);
		workProduct.setProductdesciption(productdesciption);
		workProduct.setInventoryquantity(inventoryquantity);
		workProduct.setTakedown(takedown);
		workProduct.setProductdesciption(productdesciption);
		workProduct.setInventoryquantity(inventoryquantity);
		workProduct.setInventoryquantity(productcategoryid);
		
		if(!mf.isEmpty()) {
		byte[] imgBytes = mf.getBytes();
		workProduct.setProductimg(method.encoder(imgBytes));
		}
		pmsgService.insertProduct(workProduct);
		
		List<WorkProduct> pMsg = pmsgService.selectAll();
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		
		m.addAttribute("productcategorytakeon", productcategorytakeon);
		m.addAttribute("pMsg",pMsg);
		
		
		return "redirect:/product/all";
	}
//	//修改
//	@PostMapping("product/editProduct")
//	public String postMessage(@ModelAttribute(name = "pMsg") WorkProduct pMsg) {
//		pmsgService.insertProduct(pMsg);
//		
//		return "redirect:/product/all";
//	}

	@GetMapping("product/delete")
	public String deleteMsg(@RequestParam("productid") Long productid) {
		pmsgService.deleteById(productid);
		return "redirect:/product/all";
	}
	//=======================================
////  OK
//	@GetMapping("product/editProduct")
//	public String editMessage(@RequestParam("productid") Long productid, Model model) {
////		Optional<WorkProduct> opmsg = pmsgService.findById(productid);
//		WorkProduct pMsg = pmsgService.findById(productid);
//		
//		model.addAttribute("pMsg", pMsg);
//		return "product/editMessage";
//	}
//	//OK
//	@PostMapping("product/editProduct")
//	public String postMessage(@RequestParam("productid") Long productid, 
//			@RequestParam("productname") String productname, 
//			@RequestParam("productcategory")  String productcategory,
//			@RequestParam("productprice") Integer productprice,
//			@RequestParam("productimg") MultipartFile mf,
//			@RequestParam("productdesciption") String productdesciption,
//			@RequestParam("administrator") String administrator,
//			@RequestParam("inventoryquantity") Integer inventoryquantity,
//			@RequestParam("takedown") String takedown,Model m) throws IOException {
//		WorkProduct workProduct = pmsgService.findById(productid);
//		Util method = new Util();
////		WorkProduct newworkProduct = new WorkProduct();
//		
//		workProduct.setProductname(productname);
//		workProduct.setProductcategory(productcategory);
//		workProduct.setProductprice(productprice);
//		workProduct.setAdministrator(administrator);
//		workProduct.setProductdesciption(productdesciption);
//		workProduct.setInventoryquantity(inventoryquantity);
//		workProduct.setTakedown(takedown);
//		workProduct.setProductdesciption(productdesciption);
//		workProduct.setInventoryquantity(inventoryquantity);
//		
//		if(!mf.isEmpty()) {
//			byte[] imgBytes = mf.getBytes();
//			workProduct.setProductimg(method.encoder(imgBytes));
//		}
//		pmsgService.insertProduct(workProduct);
//		
//		List<WorkProduct> pMsg = pmsgService.selectAll();
//		
//		m.addAttribute("pMsg",pMsg);
//		
//		
//		return "redirect:/product/all";
//	}
////	//修改
////	@PostMapping("product/editProduct")
////	public String postMessage(@ModelAttribute(name = "pMsg") WorkProduct pMsg) {
////		pmsgService.insertProduct(pMsg);
////		
////		return "redirect:/product/all";
////	}
//	
//	@GetMapping("product/delete")
//	public String deleteMsg(@RequestParam("productid") Long productid) {
//		pmsgService.deleteById(productid);
//		return "redirect:/product/all";
//	}

//	@PostMapping("api/postProduct")
//	@ResponseBody
//	public List<WorkProduct> postMessageApi(@RequestBody ProductDto dto) {
//		String newpMsg = dto.getPmessage();
//
//		WorkProduct workMsg = new WorkProduct();
//		workMsg.setProductname(newpMsg);
//		pmsgService.insertProduct(workMsg);
//
//		Page<WorkProduct> page = pmsgService.findByPage(1);
//		List<WorkProduct> content = page.getContent();
//
//		return content;
//	}
	
	
//	@GetMapping("/shopad/update")
//	public String UpdateAd(@RequestParam("id") Integer id, Model m) {
//		ShopAdvertisement ad = sService.findById(id);
//		m.addAttribute("ad", ad);
//		return "advertisement/updateShopAd";
//	}
//	 關鍵字查詢
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
//	public String queryNameAll(@RequestParam("productcategory") String productname, Model m, HttpSession session) {
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
	
	
	// 圖片未成功
//		@PostMapping("postProduct")
//		public String addMessage(@RequestParam("imgFile") MultipartFile mf, Model model) throws IOException {
////			System.out.println("qweqeqweqweweqw");
////			String base64Str=productDto.getProductimgdto();
////			if(!StringUtil.isBlank(path)) {
////				
////			}
////			System.out.println(productDto.getProductimg());
//			ProductDto method = new ProductDto();
//			WorkProduct test = new WorkProduct();
//			String producttype = productimgdto.getProductimgdto;
//			byte[] imgBytes = mf.getBytes();
//			System.out.println(imgBytes);
//			String img = method.encoder(imgBytes);
//			System.out.println(method.encoder(imgBytes));
//			test.setProductimg(img);
////			WorkProduct product = pmsgService.insertProduct(imgBytes);
//			WorkProduct newpMsg = new WorkProduct();
//			WorkProduct lastestpMsg = pmsgService.getLastest();
	//
//			model.addAttribute("workProduct", newpMsg);
//			model.addAttribute("lastestpMsg", lastestpMsg);
//			return "product/addMessage";
//		}
		// img byte[]
//		@PostMapping("postProduct")
//		public String addNewFirm(@RequestParam String productname, @RequestParam String productcategory,
//								 @RequestParam Integer productprice, @RequestPart MultipartFile productimg,
//								 @RequestParam String imgtype,
//								 @RequestParam String productdesciption,
//								 @RequestParam Integer inventoryquantity,
//								 @RequestParam String takedown,Model m) {
//			WorkProduct newProduct = new WorkProduct();
	//
//			String productType = productimg.getContentType();
	//
//			System.out.println(productType);
	//
//			if(!productType.startsWith("image")) {
//				
//				Map<String, String> errors = new HashMap<String, String>();
//				errors.put("firmLogo", "檔案類型必須為圖片");
//				
//				ProductDto productDto = new ProductDto();
//							
//				m.addAttribute("errors", errors);
//				m.addAttribute("productDto", productDto);
//				return "product/addMessage";
//			}
	//
//			newProduct.setProductname(productname);
//			newProduct.setProductcategory(productcategory);
//			newProduct.setProductprice(productprice);
//			newProduct.setImgtype(imgtype);
//			newProduct.setProductdesciption(productdesciption);
//			newProduct.setInventoryquantity(inventoryquantity);
//			newProduct.setTakedown(takedown);
//			try {
//				newProduct.setProductimg(productimg.getBytes());
//			} catch (IOException e) {
//				e.printStackTrace();
//				ProductDto proDto = new ProductDto();
//				m.addAttribute("productDto", proDto);
//				return "product/addMessage";
//			}
	//
//			pmsgService.insertProduct(newProduct);
	//
//			return "redirect:/product/all";
//		}

}

