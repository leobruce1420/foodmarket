package com.foodmarket.app.checkOut;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
public class CheckOutController {
	
	@Autowired
	private MemberServiceInterface memberService;

	private static final Logger logger = LoggerFactory.getLogger(CheckOutController.class);

	@GetMapping("/goECPay")
	public void goECPay(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		// 要取得訂單資料的bean，資料我先寫死
		
		
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowStr = sdf1.format(new Date()).toString();
		obj.setMerchantTradeNo(nowStr+"fmk");
		
		//obj.setMerchantTradeDate("2017/01/01 08:05:23");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		obj.setMerchantTradeDate(sdf.format(new Date()));
		
		obj.setTotalAmount("450");
		obj.setTradeDesc("foodMarket");
		
		//obj.setItemName("TestItem");
		obj.setItemName("50x1#200x2");
		
		obj.setReturnURL("http://localhost:8080/foodmarket/checkOut/returnURL");
		obj.setOrderResultURL("http://localhost:8080/foodmarket/checkOut/showHistoryOrder");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);

//
//		AllInOne aio = new AllInOne("");
//		//AioCheckOutDevide aioCceck = new AioCheckOutDevide();
//		AioCheckOutOneTime aioCceck = new AioCheckOutOneTime();
//
//		aioCceck.setMerchantID("2000132");
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		sdf.setLenient(false);
//		aioCceck.setMerchantTradeDate(sdf.format(new Date()));
//
//		// 要取得訂單資料的bean，資料我先寫死
//		aioCceck.setTotalAmount("1000");
//		aioCceck.setTradeDesc("foodMarket 好食光市場");
//		aioCceck.setItemName("測試結帳收你1000元");
//		aioCceck.setMerchantTradeNo("202206291447m3");
//		aioCceck.setReturnURL("http://localhost/foodmarket/checkOut/returnURL");
//		aioCceck.setOrderResultURL("http://localhost/foodmarket/checkOut/showHistoryOrder");
//		
//	
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.print(form);
	}

	@PostMapping("/checkOut/returnURL")
	public void returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo, @RequestParam("RtnCode") int RtnCode,
			@RequestParam("TradeAmt") int TradeAmt, HttpServletRequest request) {
		if ((request.getRemoteAddr().equalsIgnoreCase("175.99.72.1")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.11")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.24")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.28")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.32")) && RtnCode == 1) {

//			//抓訂單id，用id搜尋訂單然後改狀態
//			String orderIdStr = MerchantTradeNo.substring(8);
//			int OrderId = Integer.parseInt(orderIdStr);
//			//findById(OrderId)

			logger.info("test check out ok");
		}

	}

	@RequestMapping(path = "/checkOut/showHistoryOrder", method = {RequestMethod.GET,RequestMethod.POST})
	public String showHistoryOrder(Model model, HttpSession session) {
//		Long sessionUId = (Long) session.getAttribute("loginUserId");
//		Member member = memberService.findById(sessionUId);
		
		//透過使用者取得訂單資料並呈現，此處先用index代替
		logger.info("test check out HistoryOrder");
		return "index";
	}

}
