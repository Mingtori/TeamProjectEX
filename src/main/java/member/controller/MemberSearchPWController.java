package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberSearchPWController {
	private static final String getPage="pwsearchForm";
	private static final String gotoPage="redirect:/login.me";
	private static final String command="pwsearch.me";
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(){
		System.out.println(this.getClass() + " get");
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			Member member,
			HttpServletResponse response) throws IOException{
		System.out.println(this.getClass() + " post");
		String pw = memberDao.getMemberByPw(member);
		System.out.println("pw : " + pw);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(pw != null){
			writer.println("<script>");
			writer.println("alert('" + "비밀번호 : " + pw + "')");
			writer.println("location.href='login.me'");
			writer.println("</script>");
			writer.flush();
		}else{
			writer.println("<script>");
			writer.println("alert('해당 사용자가 없습니다.')");
			writer.println("</script>");
			writer.flush();
		}
		return getPage;
	}
}
