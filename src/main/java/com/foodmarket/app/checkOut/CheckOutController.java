package com.foodmarket.app.checkOut;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;

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
import com.foodmarket.app.shopcar.service.ShopCartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
public class CheckOutController {
	
	@Autowired
	private MemberServiceInterface memberService;

	@Autowired
	private ShopCartService shopCartService;
	
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

	
	@RequestMapping(path = "/checkOut/returnURL", method = {RequestMethod.GET,RequestMethod.POST})
	public String returnURL(HttpServletRequest request) {
		
		//之後更改流程(暫定不用這支，直接在/checkOut/showHistoryOrder改訂單狀態)：===================================================
		//因為 請確認特店的 Server URL 連接 port 為 http 80 port 與 https 443 port 我們是8080所以......
		//1、檢查傳入值
		//2、更新資料庫的訂單狀態
		
		logger.info("test check start");
		
		AllInOne all = new AllInOne("");
		
		Enumeration<String> attrNamesList = request.getParameterNames();
		Hashtable<String, String> params = new Hashtable<String, String>();
		while(attrNamesList.hasMoreElements()) {
			String para = attrNamesList.nextElement();
			params.put(para,request.getParameter(para));
		}
		
		if(all.compareCheckMacValue(params)) {
			//更新資料庫的訂單狀態===========================================================================================

			if(Integer.parseInt(request.getParameter("RtnCode"))==1 && Integer.parseInt(request.getParameter("SimulatePaid"))==0) {				
				//order.setStatus(OrderStatus.PAID);
				logger.info("test check out ok");
			}else {
				//order.setStatus(OrderStatus.UNPAID);
				logger.info("test check out not ok");
			}
			return "1|OK";
			
		}else {
			logger.info("test check out not ok");
			return "";
		}

	}

	@RequestMapping(path = "/checkOut/showHistoryOrder", method = {RequestMethod.GET,RequestMethod.POST})
	public String showHistoryOrder(Model model, HttpSession session) {
		//之後更改流程：==================================================================================================
		//1、更新資料庫的訂單狀態
		//2、return回顯示訂單處
		
		
//		Long sessionUId = (Long) session.getAttribute("loginUserId");
//		Member member = memberService.findById(sessionUId);
		
		logger.info("test check out HistoryOrder");
		return "index";
	}

}
