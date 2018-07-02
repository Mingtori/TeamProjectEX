package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberSearchIDController {

	private static final String getPage = "idsearchForm";
	private static final String gotoPage = "redirect:/login.me";
	private static final String command = "/idsearch.me";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet() {
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public void doActionPost(@ModelAttribute("idsearch") Member member, HttpServletResponse response)
			throws IOException {
		System.out.println(member.getMemname() + "/" + member.getMememail());
		Member bean = memberDao.getMemberID(member);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
	
		if(bean != null){
			System.out.println("아이디 : "+bean.getMemid());
			writer.println("<script>");
			writer.println("alert('아이디 : " + bean.getMemid()+"');");
			writer.println("location.href='login.me';");
			writer.println("</script>");
			writer.flush();
		}else{
			System.out.println("해당 회원이 없습니다");
			writer.println("<script>");
			writer.println("alert('해당 회원이 없습니다');");
			writer.println("location.href='idsearch.me';");
			writer.println("</script>");
			writer.flush();
		}
	}

}
