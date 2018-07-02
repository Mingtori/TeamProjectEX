package page.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	private static final String getPage="myPage";
	private static final String loginPage="../member/loginForm";
	private static final String gotoPage="redirect:/myPage";
	private static final String command="mypage.pg";
	
	@RequestMapping(command)
	public String doActionGet(HttpSession session){
		// 로그인 안되있으면 로그인 페이지로
		if(session.getAttribute("loginfo") == null){
			session.setAttribute("destination", gotoPage);
			return loginPage;
		}
		// 로그인 되어있으면 마이페이지로
		return getPage;
	}
}
