package com.kh.almin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.almin.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {//Interceptor를 통한 로그인 처리
	/* Interceptor의 특징
	1. prehandle에서 return값이 false일 경우 다음으로 넘어가지 않고 끝나게 된다.
	2. posthandle의 경우 Controller에서 Exception이 발생 할 경우 posthandle로 요청이 넘어오지 않는다.
	3. afterCompletion의 경우 Exception이 발생하여도 뷰단은 실행된다. */	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        HttpSession session = request.getSession();
        Member loginInfo = (Member) session.getAttribute("loginInfo");
        if(loginInfo == null){//세션정보가 없을 경우 로그인 페이지로 이동시킨다.
            response.sendRedirect("/logins");
            //return 값을 false로 해주어, 다음 요청으로 넘어가지 않게 해준다.
            return false;
        }
        return true;
    } 
	/* prehandle -> 로그인 여부 체크할 때 많이 씀.
	posthandle -> 어떤 유저가 어떤 컨트롤러 타는지 검사할때 많이 씀.
	after (쓸일별로없다.) */
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
