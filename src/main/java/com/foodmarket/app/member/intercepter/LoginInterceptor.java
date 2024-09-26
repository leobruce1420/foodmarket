package com.foodmarket.app.member.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.foodmarket.app.member.service.MemberServiceInterface;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Autowired
	private MemberServiceInterface memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		
		String uri = new String(request.getRequestURI());
		
		Long id = (Long) request.getSession().getAttribute("loginUserId");

		// 已登入
		if(id != null) {
			if(memberService.findById(id).getAuthCheck().equals("true")) {
				logger.info("會員編號：" + id + " 訪問 " + uri);
				return true;
			}else {
				logger.info("未驗證會員編號：" + id + " 訪問 " + uri + "，已導向重發驗證!");
				response.sendRedirect("/foodmarket/reSendAuth");
				return false;
			}
		}
		// 未登入
		else {
			logger.info("未登入之使用者嘗試訪問"+uri+"，已導向登入頁面!");
			response.sendRedirect("/foodmarket/login");
			return false;
		}
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            @Nullable ModelAndView modelAndView) throws Exception {

    }
    
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
            @Nullable Exception ex) throws Exception {

    }

}
