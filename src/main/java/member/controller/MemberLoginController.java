package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private static final String getPage="loginForm";
	private static final String gotoPage="redirect:/";
	private static final String command="login.me";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(){
		System.out.println(this.getClass() + " get");
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(Member member,
			HttpSession session,
			HttpServletResponse response) throws IOException{
		System.out.println(this.getClass() + " post");
		System.out.println(member.getMemid() + "/" + member.getMempw());
		Member login = memberDao.getMember(member.getMemid());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(login == null){	// 아이디가 없을때
			System.out.println("login null");
			writer.println("<script>");
			writer.println("alert('아이디가 없습니다.')");
			writer.println("</script>");
			writer.flush();
			return getPage;
		}else{
			System.out.println("login.getMemid() : " + login.getMemid());
			if(!member.getMempw().equals(login.getMempw())){	// 비밀번호가 틀릴때
				writer.println("<script>");
				writer.println("alert('비밀번호가 틀립니다.')");
				writer.println("</script>");
				writer.flush();
				return getPage;
			}else{	// 비밀번호가 맞을때
				if("승인대기".equals(login.getMempermit())){
					writer.println("<script>");
					writer.println("alert('가입 승인대기 중 입니다.')");
					writer.println("</script>");
					writer.flush();
					return getPage;
				}
				session.setAttribute("loginfo", login);
				String destination = (String)session.getAttribute("destination");
				session.removeAttribute("destination");
				if(destination != null){
					return destination;
				}
				return gotoPage;
			}
			
		}
	}
}