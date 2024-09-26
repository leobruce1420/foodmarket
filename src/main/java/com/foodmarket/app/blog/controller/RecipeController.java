package com.foodmarket.app.blog.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.blog.model.MemberLikeRecipe;
import com.foodmarket.app.blog.model.Recipe;
import com.foodmarket.app.blog.model.RecipeType;
import com.foodmarket.app.blog.service.MemberLikeRecipeServer;
import com.foodmarket.app.blog.service.RecipeService;
import com.foodmarket.app.blog.service.RecipeTypeService;
import com.foodmarket.app.blogadvertisement.BlogAdService;
import com.foodmarket.app.blogadvertisement.BlogAdvertisement;





@Controller
public class RecipeController {

	@Autowired
	private RecipeService rService;
	
	@Autowired
	private RecipeTypeService recipeTypeService;
	
	@Autowired
	private BlogAdService bSer;
	
	@Autowired
	private MemberLikeRecipeServer memberLikeRecipeServer;
	
	@Autowired
	public RecipeController(RecipeService rService, RecipeTypeService recipeTypeService,MemberLikeRecipeServer memberLikeRecipeService) {
		this.rService = rService;
		this.recipeTypeService = recipeTypeService;
	}
	
//	@RequestMapping(value="postRecipe", method=RequestMethod.GET)
//	public String greetingForm(Model model) {
//	    model.addAttribute("", new Recipe());
//	    return "addRecipe";
//	}
	

	@PostMapping("managerPostRecipe")
	public String managerAddRecipe(@ModelAttribute("recipe") Recipe rec,Model model) {
		rService.insertRecipe(rec);
		
		Recipe newRec = new Recipe();
//		WorkMessages lastestMsg = msgService.getLastest();
		
		model.addAttribute("recipe", newRec);
//		model.addAttribute("lastestMsg", lastestMsg);
		System.out.println(rec);
		return "redirect:/recipe/backall";
	}
	
	@PostMapping("postRecipe")
	public String addRecipe(@ModelAttribute("recipe") Recipe rec,Model model) {
		rService.insertRecipe(rec);
		Recipe newRec = new Recipe();
		model.addAttribute("recipe", newRec);
		System.out.println(rec);
		return "redirect:/recipe/all";
	}
	
	@PostMapping("postRichRecipe")
	public String addRecipeText(@ModelAttribute("recipe") Recipe rec,Model model) {
		rService.insertRecipe(rec);
		Recipe newRec = new Recipe();
		model.addAttribute("recipe", newRec);
		System.out.println(rec);
		return "redirect:/recipe/all";
	}
	
	
	@PostMapping("postRecipeRich")
	public String richAddRecipe(@ModelAttribute("recipe") Recipe rec,Model model) {
		rService.insertRecipe(rec);
		Recipe newRec = new Recipe();
		model.addAttribute("recipe", newRec);
		System.out.println(rec);
		return "redirect:/recipe/backall";
	}
	
	@GetMapping("recipe/backEditRecipe")
	public String backEditRecipe(@RequestParam("recipePostId") Long recipePostId,Model model) {
		Recipe rec = rService.findById(recipePostId);
		model.addAttribute("rec", rec);
		return "blog/backEditRecipe";
	}
	
	@PostMapping("recipe/backEditRecipe")
	public String insertBackEditRecipe(@ModelAttribute(name="rec") Recipe rec) {
		rService.save(rec);
		return "redirect:/recipe/backall";
	}
	
	@GetMapping("recipe/editRecipe")
	public String postEditRecipe(@RequestParam("recipePostId") Long recipePostId,Model model) {
		Recipe rec = rService.findById(recipePostId);
		model.addAttribute("rec", rec);
		return "blog/editRecipe";
	}

	@PostMapping("recipe/editRecipe")
	public String insertEditRecipe(@ModelAttribute(name="rec") Recipe rec,HttpSession session) {
		rService.save(rec);

		return "redirect:/lock/recipe/memberHouse";
	}
	
	@GetMapping("recipe/deleteOwnRecipe")
	public String deleteOwnRecipe(@RequestParam("recipePostId") Long recipePostId) {
		rService.deleteById(recipePostId);
		return "redirect:/lock/recipe/memberHouse";
	}
	
	@GetMapping("recipe/deleteRecipe")
	public String deleteRecipe(@RequestParam("recipePostId") Long recipePostId) {
		rService.deleteById(recipePostId);
		return "redirect:/recipe/backall";
	}

	@GetMapping("recipe/all")
	public ModelAndView viewRecipe(ModelAndView mav,Model m, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<Recipe> page = rService.findByViewPage(pageNumber);
		Page<Recipe> likePage = rService.findByViewPage2(pageNumber);
		Page<RecipeType> recType = recipeTypeService.findByPage(pageNumber);
		List<BlogAdvertisement> ad = bSer.findByBoard();
		mav.getModel().put("page", page);
		mav.getModel().put("likePage", likePage);
		mav.getModel().put("recType", recType);
		m.addAttribute("ad",ad);
		
		mav.setViewName("blog/viewRecipe");
		return mav;
	}
	
//	@GetMapping("recipe/trueAll")
//	public ModelAndView viewTrueRecipe(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<Recipe> page = rService.findByPage(pageNumber);
//		List<RecipeType> recType = recipeTypeService.getRecipeType();
//		
//		mav.getModel().put("page", page);
//		mav.getModel().put("recType", recType);
//	
//		
//		mav.setViewName("blog/viewRecipe");
//		return mav;
//	}
	
//	@GetMapping("recipe/search")
//	public ModelAndView searchRecipe(ModelAndView mav, 
//			@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<Recipe> page = rService.findBySearchPage(pageNumber);
//		mav.getModel().put("page", page);
//		mav.setViewName("blog/searchRecipe");
//		return mav;
//	}
//	
	@GetMapping("recipe/search")
	public ModelAndView searchRecipeFilter(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
		    @RequestParam("recipeType") String recipeType){
		if(recipeType == "") {
		Page<Recipe> page = rService.findBySearchPage(pageNumber);
		mav.getModel().put("page", page);
		mav.setViewName("blog/searchRecipe");
		return mav;
		}
		else {
			Page<Recipe> page = rService.findBySearchPageByType(pageNumber,recipeType);
			mav.getModel().put("page", page);
			mav.setViewName("blog/searchRecipe");
			return mav;
		}
	}
	
	@GetMapping("recipe/findByTagLike")
	public ModelAndView findByTagLike(ModelAndView mav, 
			@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
		    @RequestParam("postTag") String postTag) {
		Page<Recipe> page = rService.findByTagLike(pageNumber,postTag);
		System.out.println(page);
		mav.getModel().put("page", page);
		mav.setViewName("blog/searchRecipe");
		return mav;
	}
	
	@GetMapping("recipe/showRecipe")
	public String showRecipe(@RequestParam("recipePostId") Long recipePostId,Model model) {
		Recipe rec = rService.findById(recipePostId);
		model.addAttribute("rec", rec);
		return "blog/showRecipe";
	}

	@GetMapping("recipe/showHouseRecipe")
	public String showHouseRecipe(@RequestParam("recipePostId") Long recipePostId,Model model) {
		Recipe rec = rService.findById(recipePostId);
		model.addAttribute("rec", rec);
		return "blog/showHouseRecipe";
	}
	
	@GetMapping("recipe/forshowrecipe/{recipePostId}")
	public ResponseEntity<Recipe> getRecipe(@PathVariable Long recipePostId) {
		return new ResponseEntity<Recipe>(rService.getRecipeById(recipePostId), HttpStatus.OK);
	}
	
	@GetMapping("recipe/addLikeTimeView/{recipePostId}")
	public String updateRecipeLikeTime(@PathVariable Long recipePostId) {
		
			Recipe rec = rService.findById(recipePostId);
			 Integer liketime = rec.getPostLikeTime();
			System.out.println(rec);
			System.out.println("文章喜歡人數:"+liketime);
			liketime++;
			System.out.println("之後喜歡的人數:"+liketime);
			rec.setPostLikeTime(liketime);
			rService.insertRecipe(rec);
			return "redirect:/recipe/all";
	}
	
	@PostMapping("recipe/addRecipeToLike/{recipePostId}")
	@ResponseBody
	public Recipe addRecipeToLike(@PathVariable Long recipePostId,HttpSession session) {
		
		Recipe rec = rService.findById(recipePostId);
		Integer liketime = rec.getPostLikeTime();
		System.out.println(rec);
		System.out.println("文章喜歡人數:"+liketime);
		liketime++;
		System.out.println("之後喜歡的人數:"+liketime);
		rec.setPostLikeTime(liketime);
		rService.insertRecipe(rec);
		System.out.println(rec);
		
		Object customerId = session.getAttribute("loginUserId");
		MemberLikeRecipe mlr = new MemberLikeRecipe();
		mlr.setRecipePostId(recipePostId);
		mlr.setCustomerId(Long.parseLong(customerId.toString()));
		memberLikeRecipeServer.testSaveYourLikeRecipe(mlr);
		
		
		return rec;
	}
	
	@PostMapping("recipe/cancelRecipeToLike/{recipePostId}")
	@ResponseBody
	public Recipe cancelRecipeToLike(@PathVariable Long recipePostId,HttpSession session) {
		
		Recipe rec = rService.findById(recipePostId);
		Integer liketime = rec.getPostLikeTime();
		System.out.println(rec);
		System.out.println("文章喜歡人數:"+liketime);
		liketime--;
		System.out.println("之後喜歡的人數:"+liketime);
		rec.setPostLikeTime(liketime);
		rService.insertRecipe(rec);
		System.out.println(rec);
		
		Object customerId = session.getAttribute("loginUserId");
		memberLikeRecipeServer.testDeleteYourLikeRecipe(Long.parseLong(customerId.toString()),recipePostId);
		
		return rec;
	}

	@PostMapping("recipe/addLikeTimeSearch/{recipePostId}")
	public String updateRecipeLikeTime2(@PathVariable Long recipePostId) {
		
		Recipe rec = rService.findById(recipePostId);
		Integer liketime = rec.getPostLikeTime();
		System.out.println(rec);
		System.out.println("文章喜歡人數:"+liketime);
		liketime++;
		System.out.println("之後喜歡的人數:"+liketime);
		rec.setPostLikeTime(liketime);
		rService.insertRecipe(rec);
		return "redirect:/recipe/search?recipeType=";
	}
	
	@GetMapping("lock/recipe/addLikeTimeByCustomer")
	public MemberLikeRecipe setRecipeToLike(@RequestParam("recipePostId") Long recipePostId,HttpSession session) {
		Object customerId = session.getAttribute("loginUserId");
		MemberLikeRecipe mlr = new MemberLikeRecipe();
		mlr.setRecipePostId(recipePostId);
		mlr.setCustomerId(Long.parseLong(customerId.toString()));
		memberLikeRecipeServer.testSaveYourLikeRecipe(mlr);
		

		return mlr;
	}
	
	@GetMapping("lock/recipe/deleteLikeTimeByCustomer")
	public void deleteRecipeFromLike(@RequestParam("recipePostId") Long recipePostId,HttpSession session) {
		Object customerId = session.getAttribute("loginUserId");
		memberLikeRecipeServer.testDeleteYourLikeRecipe(Long.parseLong(customerId.toString()),recipePostId);
		return;
	}
	
	@GetMapping("ajaxRecipeList")
	public ResponseEntity<List<Recipe>> getRecipeList() {
		return new ResponseEntity<List<Recipe>>(rService.getRecipeList(), HttpStatus.OK);
	}
	
	@GetMapping("ajaxRecipe/{recipePostId}")
	public ResponseEntity<Recipe> getCompany(@PathVariable Long recipePostId) {
		return new ResponseEntity<Recipe>(rService.findById(recipePostId), HttpStatus.OK);
	}

	
    
}