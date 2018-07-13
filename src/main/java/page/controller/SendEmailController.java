package page.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SendEmailController {
	private static final String command="send.pg";
	@Autowired
	private JavaMailSender mailSender; // xml에 등록한 bean autowired

	@RequestMapping(command)
	public void doActionPost(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone,
			@RequestParam("message") String message
			) throws FileNotFoundException, URISyntaxException{
		sendMail(email, "jooinni@gmail.com", "contact me : "+name, message, null);
	}
	
	public void sendMail(String from, String to, String subject, String text, String formUrl)
			throws FileNotFoundException, URISyntaxException {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(text);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
