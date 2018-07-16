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
		if(login == null){	// ���̵� ������
			System.out.println("login null");
			writer.println("<script>");
			writer.println("alert('���̵� �����ϴ�.')");
			writer.println("</script>");
			writer.flush();
			return getPage;
		}else{
			System.out.println("login.getMemid() : " + login.getMemid());
			if(!member.getMempw().equals(login.getMempw())){	// ��й�ȣ�� Ʋ����
				writer.println("<script>");
				writer.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
				writer.println("</script>");
				writer.flush();
				return getPage;
			}else{	// ��й�ȣ�� ������
				if("���δ��".equals(login.getMempermit())){
					writer.println("<script>");
					writer.println("alert('���� ���δ�� �� �Դϴ�.')");
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