package com.foodmarket.app.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.model.productcategoryBean;
import com.foodmarket.app.product.service.ProductcategoryService;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.shopadvertisement.ShopAdService;
import com.foodmarket.app.shopadvertisement.ShopAdvertisement;
import com.foodmarket.app.wishList.model.WishList;
import com.foodmarket.app.wishList.service.WishListServiceInterface;

@Controller
public class ProductPageController {

	@Autowired
	private WorkProductService pmsgService;
	@Autowired
	private ProductcategoryService pcmsgService;

	@Autowired
	private ShopAdService sService;

	@Autowired
	private MemberServiceInterface memberService;

	@Autowired
	private WishListServiceInterface wishListService;

	// 首頁 分頁全部查詢 inner join 測試
	@GetMapping("/HOME")
	public String welcomePage(@RequestParam(required = false, value = "takedown") String takedown,
			@RequestParam(required = false, value = "takeon") String takeon,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<WorkProduct> page = pmsgService.findByTakeDown(takedown, pageNumber);
//		List<productcategoryBean> productcategory = pcmsgService.selectproductcategoryAll();
		List<ShopAdvertisement> ad = sService.findByBoard();
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		model.addAttribute("productcategorytakeon", productcategorytakeon);
		model.addAttribute("ad", ad);
//		Page<productcategory> page = pmsgService.findByTakeDown(takedown,pageNumber);

		model.addAttribute("page", page);
		return "index";

	}

//	// 首頁 分頁全部查詢
//	@GetMapping("/HOME")
//	public String welcomePage(@RequestParam (required=false ,value="takedown")String takedown, 
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,Model model) {
//		Page<WorkProduct> page = pmsgService.findByTakeDown(takedown,pageNumber);
//		
//		List<ShopAdvertisement> ad = sService.findByBoard();
//		model.addAttribute("ad",ad);
//		
////		Page<productcategory> page = pmsgService.findByTakeDown(takedown,pageNumber);
//		
//		model.addAttribute("page", page);
//		return "index";
//		
//	}
	// 舊的
//	@GetMapping("/p")
//	public String welcomePage(Model model){
//		model.addAttribute("test", "qweweq");
//		return "index";
//		
//	}
//inner join
//	@GetMapping("product/add")
//	public String addcategoryPage(Model model) {
////		Util method = new Util();
//		WorkProduct workProduct = new WorkProduct();
//		WorkProduct lastestpMsg = pmsgService.getLastest();
//		List<productcategoryBean> productcategory = pcmsgService.selectproductcategoryAll();
////		byte[] imgBytes = mf.getBytes();
////		workProduct.setProductimg(method.decoder(imgBytes));
//		model.addAttribute("productcategory", productcategory);
//		model.addAttribute("workProduct", workProduct);
//		model.addAttribute("lastestpMsg", lastestpMsg);
//
//		return "product/addMessage";
//	}
	// 好的
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
//	@GetMapping("product/all")
//	public ModelAndView viewProducts(ModelAndView mav,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
//
//		mav.getModel().put("page", page);
//		mav.setViewName("product/viewMessages");
////		mav.setViewName("index");
//		return mav;
//	}
//後台查詢所有 OK
	@GetMapping("product/all")
	public ModelAndView viewProducts(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber){
		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
		Page<productcategoryBean> cpage = pcmsgService.findByPage(pageNumber);

		mav.getModel().put("page", cpage);
		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
//		mav.setViewName("index");
		return mav;
	}

	// 後台查詢所有 inner join
//	@GetMapping("product/all")
//	public ModelAndView viewProducts(ModelAndView mav,
//			@RequestParam(required = false, value = "categoryid")Integer  categoryid,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		Page<WorkProduct> page = pmsgService.findByPage(pageNumber);
////		Optional<WorkProduct> ProductBycategoryId = pmsgService.findProductByCategoryid(productcategoryBean.getCategoryid());
////		WorkProduct category = ProductBycategoryId.get();
////		Page<WorkProduct> pcage = pmsgService.findByPage1(pageNumber, category.getCategoryid());
//		Page<WorkProduct> pcage = pmsgService.findproductBycategoryidPage(categoryid,pageNumber);
//		productcategoryBean pcb = new productcategoryBean();
//		pcb.setCategoryid(categoryid);
//		WorkProduct workProduct = new WorkProduct();
//		workProduct.setProductcategoryid(pcb);
//		
//		mav.getModel().put("page", page);
//		mav.getModel().put("pcage", pcage);
////		mav.getModel().put("pcage", pcage);
//		mav.setViewName("product/viewMessages");
////		mav.setViewName("index");
//		return mav;
//	}

	// 0622T0024 商品全部查詢
//	@GetMapping("product/allproduct")
//	public ModelAndView viewAllProducts(ModelAndView mav,
//			@RequestParam(name = "to", defaultValue = "1") Integer productNumber) {
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
			@RequestParam(required = false, value = "productcategory") String productcategory,
			@RequestParam(required = false, value = "takeon") String takeon,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<WorkProduct> page = pmsgService.findByProductcategorypage(productcategory, pageNumber);
		Page<productcategoryBean> cpage = pcmsgService.findByProductCategoryTakeonPage(takeon, pageNumber);

		mav.getModel().put("page", cpage);
		mav.getModel().put("page", page);
		mav.setViewName("product/viewMessages");
		return mav;

	}

//	消費者商品種類查詢無分頁 跳頁顯示 OK
//	@GetMapping("product/category")
//	public String viewProductcategory(@RequestParam(required = false, value = "productcategory") String productcategory,
//			Model m) {
//		List<WorkProduct> workProduct = pmsgService.findByProductcategoryKey(productcategory);
//
//		m.addAttribute("workProduct", workProduct);
//		m.addAttribute("productcategory", productcategory);
//		return "product/viewcategoryMessages";
//
//	}
//	消費者商品種類查詢無分頁 跳頁顯示 join
	@GetMapping("product/category")
	public String viewProductcategory(@RequestParam(required = false, value = "productcategory") String productcategory,
			@RequestParam(required = false, value = "takeon") String takeon, Model m) {
		List<WorkProduct> workProduct = pmsgService.findByProductcategoryKey(productcategory);
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		m.addAttribute("productcategorytakeon", productcategorytakeon);
		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productcategory", productcategory);
		return "product/viewcategoryMessages";

	}

//	消費者商品種類查詢無分頁 首頁顯示(舊版)
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
//	
//	// 消費者點擊商品名稱只顯示單一商品不分頁 測試
	@GetMapping("product/product")
	public String viewProductById(@RequestParam(required = false, value = "productid") long productid, Model m,
			HttpSession session) {

		WorkProduct product = pmsgService.findById(productid);

		Long sessionUId = (Long) session.getAttribute("loginUserId");

		// 若有登入則檢查是否收藏
		if (sessionUId != null) {
			Member member = memberService.findById(sessionUId);
			WishList listCheck = wishListService.findByMemberAndProduct(member, product);

			if (listCheck != null) {
				m.addAttribute("listCheck", true);
				m.addAttribute("workProduct", product);
				return "product/viewnameMessagesById";
			} else {
				m.addAttribute("listCheck", false);
				m.addAttribute("workProduct", product);
				return "product/viewnameMessagesById";
			}

		}
		// 沒有登入
		m.addAttribute("listCheck", false);
		m.addAttribute("workProduct", product);
		return "product/viewnameMessagesById";

	}

	// 消費者點擊商品名稱只顯示單一商品不分頁 測試
	@GetMapping("product/productname")
	public String viewProductname(@RequestParam(required = false, value = "productname") String productname, Model m) {
		List<WorkProduct> workProduct = pmsgService.findByName(productname);

		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productname", productname);
		return "product/viewnameMessages";

	}

	// 消費者查詢商品名稱顯示商品不分頁 測試
	@GetMapping("product/searchproductname")
	public String searchProductname(@RequestParam(required = false, value = "productname") String productname,
			@RequestParam(required = false, value = "takeon") String takeon, Model m) {
		List<WorkProduct> workProduct = pmsgService.findByProductName(productname);
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		m.addAttribute("productcategorytakeon", productcategorytakeon);
		m.addAttribute("workProduct", workProduct);
		m.addAttribute("productname", productname);
		return "product/searchnameMessages";

	}

	// 管理員商品查詢名稱分頁
	@GetMapping("product/name")
	public ModelAndView Productname(@RequestParam(required = false, value = "productname") String productname,
			@RequestParam(required = false, value = "takeon") String takeon,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, ModelAndView m) {
		Page<WorkProduct> page = pmsgService.findByNamePage(productname, pageNumber);
		Page<productcategoryBean> cpage = pcmsgService.findByProductCategoryTakeonPage(takeon, pageNumber);

		m.getModel().put("page", cpage);
		m.getModel().put("page", page);
		m.setViewName("product/viewMessages");
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

	// 後台顯示上架商品不分頁 測試
	@GetMapping("product/takedown")
	public String searchProductOn(@RequestParam(required = false, value = "takedown") String takedown,
			@RequestParam(required = false, value = "takeon") String takeon, Model m) {
		List<WorkProduct> workProduct = pmsgService.findByOn(takedown);
		List<productcategoryBean> productcategorytakeon = pcmsgService.findByProductCategoryTakeon(takeon);
		m.addAttribute("productcategorytakeon", productcategorytakeon);
		m.addAttribute("workProduct", workProduct);
		m.addAttribute("takedown", takedown);
		return "product/viewMessages";

	}

//	//前台顯示上架商品 分頁
//	@GetMapping("/HOME")
//	public ModelAndView ProductOn(@RequestParam (required=false ,value="takedown")String takedown,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
//			ModelAndView m) {
//		Page<WorkProduct> page = pmsgService.findByTakeDown(takedown,pageNumber);
//		
//		m.getModel().put("page", page);
//		m.setViewName("index");
//		return m;
//		
//	}

	// //後台顯示上架商品 分頁
//	@GetMapping("product/takedown")
//	public ModelAndView ProductOn(@RequestParam (required=false ,value="takedown")String takedown,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
//			ModelAndView m) {
//		Page<WorkProduct> page = pmsgService.findByTakeDown(takedown,pageNumber);
//		
//		m.getModel().put("page", page);
//		m.setViewName("product/viewMessages");
//		return m;
//		
//	}

	// ID查詢
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