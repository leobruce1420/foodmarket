package com.foodmarket.app.blog.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.blog.model.Recipe;
import com.foodmarket.app.blog.service.MemberLikeRecipeServer;
import com.foodmarket.app.blog.service.RecipeService;
import com.foodmarket.app.blog.service.RecipeTypeService;




@Controller
public class RecipePageController {
	
	@Autowired
	private RecipeService rService;
	
	@Autowired
	private MemberLikeRecipeServer memberLikeRecipeService;

	
	@Autowired
	public RecipePageController(RecipeService rService, RecipeTypeService recipeTypeService,MemberLikeRecipeServer memberLikeRecipeService) {
		this.rService = rService;
		this.memberLikeRecipeService = memberLikeRecipeService;
	}
	
	
	@GetMapping("/")
	public String welcomePage() {
		return "index";
	}
	
//	@GetMapping("recipe/all")
//	public ModelAndView viewRecipe(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<Recipe> page = rService.findByPage(pageNumber);
//		
//		
//		mav.getModel().put("page", page);
//	
//		
//		mav.setViewName("blog/viewRecipe");
//		return mav;
//	}
	
	@GetMapping("recipe/backall")
	public ModelAndView viewBackRecipe(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<Recipe> page = rService.findByBackPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("blog/backViewRecipe");
		return mav;
	}
	
	@GetMapping("recipe/manageradd")
	public String managerAddRecipePage(Model model) {
		Recipe recipe = new Recipe();
//		WorkMessages lastestMsg = msgService.getLastest();
		
		model.addAttribute("recipe", recipe);
//		model.addAttribute("lastestMsg", lastestMsg);
		return "blog/backAddRecipe";
	}
	
	@GetMapping("recipe/add")
	public String addRecipePage(Model model) {
		Recipe recipe = new Recipe();
		
		model.addAttribute("recipe", recipe);
		
		return "blog/addRecipe";
	}
	
	@GetMapping("recipe/richAdd")
	public String richAddRecipe(Model model) {
		Recipe recipe = new Recipe();
		
		model.addAttribute("recipe", recipe);
		
		return "blog/addRecipeRichText2";
	}
	
	
//	@GetMapping("recipe/findByTagLike")
//	public ModelAndView findByTagLike(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
//		    @RequestParam("postTag") String postTag) {
//		Page<Recipe> page = rService.findByTagLike(pageNumber,postTag);
//		System.out.println(page);
//		mav.getModel().put("page", page);
//		mav.setViewName("blog/searchRecipe");
//		return mav;
//	}

	@GetMapping("/lock/recipe/memberHouse")
	public ModelAndView getMyLikeRecipe(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
			@RequestParam("customerId") Long customerId) {
		int[] likeList = memberLikeRecipeService.getAllLikeRecipeById(customerId);
		Page<Recipe> yourrecipe = rService.findForMemberHouse(pageNumber,customerId);
		Page<Recipe> page = rService.findLikeRecipeById(likeList, pageNumber);
		mav.getModel().put("likeList", likeList);
		mav.getModel().put("page", page);
		mav.getModel().put("yourrecipe", yourrecipe);
		mav.setViewName("blog/memberPage");
		return mav;
	}
	
//	@GetMapping("recipe/memberHousestep2")
	
	
//	@GetMapping("recipe/findByTagLike")
//	public ModelAndView findByTagLike(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
//		    @RequestParam("postTag") String postTag) {
//		Page<Recipe> page = rService.findByTagLike(pageNumber,postTag);
//		mav.getModel().put("page", page);
//		mav.setViewName("blog/searchRecipe");
//		return mav;
//	}

	
//	@GetMapping("recipe/add")
//	public ModelAndView addRecipePage(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Recipe recipe = new Recipe();
//		Page<RecipeType> recType = recipeTypeService.findByPage(pageNumber);
//
//		
//		mav.getModel().put("recipe", recipe);
//		mav.getModel().put("recType", recType);
//		mav.setViewName("blog/viewRecipe");
//		return mav;
//	}
//	
	
//	@GetMapping("recipe/editRecipe")
//	public String editRecipe(@RequestParam("recipePostId") Long recipePostId,Model model) {
//		Recipe rec = rService.findById(recipePostId);
//		model.addAttribute("rec", rec);
//		return "blog/editRecipe";
//	}
//	
	 //事實上如果是"頁面"其屬性為String
	 @GetMapping("recipe/singleRecipe")
	 public String ajaxVersioin() {
		 return "blog/showRecipe";
	 }
	 
	 @GetMapping("recipe/dropTest")
	 public String dropImg() {
		 return "blog/testdroptext";
	 }
	 @GetMapping("recipe/queryTest")
	 public String query() {
		 return "blog/querytest";
	 }
}
