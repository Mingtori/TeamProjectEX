package page.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	private static final String getPage="myPage";
	private static final String loginPage="../member/loginForm";
	private static final String gotoPage="redirect:/mypage.pg";
	private static final String command="mypage.pg";
	/*@Autowired
	private JavaMailSender mailSender; // xml에 등록한 bean autowired

	public void sendMail(String from, String to, String subject, String text, String formUrl) throws FileNotFoundException, URISyntaxException {
		try{
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(mailText);
			
			mailSender.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}   
	}*/
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
