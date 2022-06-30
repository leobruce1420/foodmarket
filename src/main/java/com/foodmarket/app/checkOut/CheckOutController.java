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
	public String goECPay(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		//之後更改流程：==================================================================================================
		//1、傳入值接結帳的資料
		//2、把資料更新進資料庫
		//3、把資料set進對應欄位，到綠界成立訂單
		
		
		// 要取得訂單資料的bean，資料我先寫死
		
		//綠界物件
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		
		//給綠界的訂單號，因不可重複所以抓時間產生
		//obj.setMerchantTradeNo(nowStr+"fmk"); 在fmk後加我們db的訂單號碼===================================================
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowStr = sdf1.format(new Date()).toString();
		obj.setMerchantTradeNo(nowStr+"fmk");
		
		//給綠界的訂單時間，必須是這個格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		obj.setMerchantTradeDate(sdf.format(new Date()));
		
		//總價，>5 && <199999，不可有小數點
		obj.setTotalAmount("450");
		
		//商店名，不用改
		obj.setTradeDesc("foodMarket好食光市場");

		//商品明細，#是換行
		obj.setItemName("50x1#200x2");
		
		//當消費者付款完成後，特店接受綠界的付款結果訊息，並回應接收訊息(文件p28~)
		//(1) 特店務必判斷檢查碼[CheckMacValue]是否正確，以及是否已經對該筆訂單的付款通知，做過相對應的處理，以免造成交易狀態無法同步的損失。
		//(2) 若未正確回應 1|OK，系統會隔 5~15 分鐘後重發訊息給特店，當天重複發送四次。
		obj.setReturnURL("http://localhost:8080/foodmarket/checkOut/returnURL");
		
		//當消費者付款完成後，綠界一次性反饋付款結果通知，並將頁面導至特店自製頁面(文件p28~)
		obj.setOrderResultURL("http://localhost:8080/foodmarket/checkOut/showHistoryOrder");
		
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		
		//因為Content Type 指定為 application/x-www-form-urlencoded，先到jsp再轉綠界成立訂單!
		model.addAttribute("ecpay",form);
		return "checkOut/goECPay";
	}

	@PostMapping("/checkOut/returnURL")
	public void returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo, @RequestParam("RtnCode") int RtnCode,
			@RequestParam("TradeAmt") int TradeAmt, HttpServletRequest request) {
		
		//之後更改流程：==================================================================================================
		//1、檢查傳入值
		//2、更新資料庫的訂單狀態
		
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
