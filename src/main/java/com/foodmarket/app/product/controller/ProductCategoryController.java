package com.foodmarket.app.product.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.product.dto.ProductDto;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.productcategory;
import com.foodmarket.app.product.service.ProductcategoryService;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.product.util.Util;
import com.foodmarket.app.shopadvertisement.ShopAdvertisement;

@Controller
public class ProductCategoryController {

	@Autowired
	private ProductcategoryService pcmsgService;
	
	
	

	// 商品總類新增
	@PostMapping("postcategory")
	public String addProductcategory(@RequestParam("productcategoryname") String productcategoryname, 
			 @RequestParam("takeon") String takeon,
			Model m) throws  IOException {
		
//		try {
//			if (!pmsgService.checkLoginSession(session)) {
//				return "AdminLogin";
//			}

//			request.setCharacterEncoding("UTF-8");
			productcategory productcategory = new productcategory();

			productcategory.setProductcategoryname(productcategoryname);
			productcategory.setTakeon(takeon);



			pcmsgService.insertproductcategory(productcategory);
			WorkProduct newpMsg = new WorkProduct();
			List<productcategory> Products = pcmsgService.selectproductcategoryAll();
			m.addAttribute("workProduct", newpMsg);
			m.addAttribute("products", Products);
			return "productcategory/addMessage";

//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "product/addMessage";
	}
//修改找ID
	@GetMapping("product/editcategory")
	public String editcategory(@RequestParam("categoryid") Integer  categoryid, Model model) {
//		Optional<WorkProduct> opmsg = pmsgService.findById(productid);
		productcategory pMsg = pcmsgService.findById(categoryid);

		model.addAttribute("pMsg", pMsg);
		return "product/editcategory";
	}
	//修改商品種類
	@PostMapping("product/editProductcategory")
	public String postcategory(@RequestParam("categoryid") Integer categoryid, 
			@RequestParam("productcategoryname") String productcategoryname, 
			 @RequestParam("takeon") String takeon,Model m) throws IOException {
		productcategory productcategory = pcmsgService.findById(categoryid);
		Util method = new Util();
//		WorkProduct newworkProduct = new WorkProduct();

		productcategory.setProductcategoryname(productcategoryname);
		productcategory.setTakeon(takeon);
		
		pcmsgService.insertproductcategory(productcategory);
		
		List<productcategory> pMsg = pcmsgService.selectproductcategoryAll();
		
		m.addAttribute("pMsg",pMsg);
		
		
		return "redirect:/productcategory/all";
	}
//	修改
//	@PostMapping("product/editProduct")
//	public String postMessage(@ModelAttribute(name = "pMsg") WorkProduct pMsg) {
//		pmsgService.insertProduct(pMsg);
//		
//		return "redirect:/product/all";
//	}
// 商品種類刪除
	@GetMapping("productcategory/delete")
	public String deleteMsg(@RequestParam("categoryid") Integer categoryid) {
		pcmsgService.deleteById(categoryid);
		return "redirect:/productcategory/all";
	}

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
	@PostMapping("productcategory/all")
	public ModelAndView querycategoryAll(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		
		Page<productcategory> page = pcmsgService.findByPage(pageNumber);
		mav.getModel().put("page", page);
		mav.setViewName("product/viewproductcategory");
//		mav.setViewName("index");
		return mav;
	}

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

