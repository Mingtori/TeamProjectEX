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
			String name = member.getMemname() + "님의 비밀번호입니다.";
			String msg = "비밀번호 : " + pw + "<br>감사합니다. "; 

			writer.println("<script src='https://smtpjs.com/v2/smtp.js'></script>");
			writer.println("<script>");
			writer.println("Email.send('jihee88s@naver.com',");
			writer.println("'" + member.getMememail() + "',");
			writer.println("'" + name + "',");
			writer.println("'" + msg + "',");
			writer.println("'smtp.elasticemail.com',");
			writer.println("'jihee88s@naver.com',");
			writer.println("'c799cbfc-c6da-46a7-bb33-2ee2df827953');");
			writer.println("alert('해당 이메일로 전송했습니다');");
			writer.println("location.href='login.me';");
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
