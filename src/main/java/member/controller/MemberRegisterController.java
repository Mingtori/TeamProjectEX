package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import composite.model.CompositeDao;
import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private static final String getPage="registerForm";
	private static final String getPage2="registerForm_real";
	private static final String gotoPage="redirect:/login.me";
	private static final String command="register.me";
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CompositeDao compositeDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam(value="what", required=false) String what,
			Model model){
		if(what != null){
			model.addAttribute("what", what);
			return getPage2;
		}
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam(value="what") String what,
			@Valid Member member,
			BindingResult bindingResult,
			Model model){
		if(bindingResult.hasErrors()){
			System.out.println("유효성에러");
			return getPage2;
		}
		
		System.out.println(this.getClass()+" post 방식 들어옴");
		
		member.setMememail(member.getMememail1()+"@"+member.getMememail2());
		member.setMemphone(member.getMemphone1()+"-"+member.getMemphone2()+"-"+member.getMemphone3());
		
		
		if(what.equals("seller")){
			member.setMempermit("승인대기");
			member.setGradeid(2);
			compositeDao.insertCompany(member);
		}else{
			member.setMempermit("승인");
			member.setGradeid(1);
		}
		memberDao.insertMember(member);
		
		return gotoPage;
	}
}
