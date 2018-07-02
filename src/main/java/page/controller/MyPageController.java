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
		// �α��� �ȵ������� �α��� ��������
		if(session.getAttribute("loginfo") == null){
			session.setAttribute("destination", gotoPage);
			return loginPage;
		}
		// �α��� �Ǿ������� ������������
		return getPage;
	}
}
