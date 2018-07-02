package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {
	private static final String getPage = "logout";
	private static final String command = "logout.me";
	@RequestMapping(command)
	public String doActionGet(){
		return getPage;
	}
}
