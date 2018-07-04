package member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import composite.model.CompositeDao;
import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberUpdateController {
	private static final String getPage="updateForm";
	private static final String gotoPage="redirect:/memberlist.me";
	private static final String command="update.me";
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CompositeDao compositeDao; 
	
	@RequestMapping(value=command, method=RequestMethod.GET)	
	public String doActionGet(HttpSession session,
			Model model,
			@RequestParam(value="memid", required=false) String memid){
		System.out.println(this.getClass() + " get");
		Member loginfo, member; 
		if(memid == null){	// 본인 회원수정
			loginfo = (Member) session.getAttribute("loginfo");
			member = memberDao.getMemberJoinCG(loginfo.getMemid());
		}else{		// 관리자가 회원수정
			member = memberDao.getMemberJoinCG(memid);
		}
		System.out.println(member.getMemid());
		model.addAttribute("member", member);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPost(
			Member member,HttpSession session){
		member.setMememail(member.getMememail1()+"@"+member.getMememail2());
		if(!member.getMemid().equals("admin")){
			member.setMemphone(member.getMemphone1()+"-"+member.getMemphone2()+"-"+member.getMemphone3());
		}
		System.out.println(member.getComid());
		memberDao.updateMember(member);
		compositeDao.updateCompany(member);
		ModelAndView mav = new ModelAndView();
		Member login = (Member)session.getAttribute("loginfo");
		if(login.getMemid().equals(member.getMemid())){
			mav.setViewName("redirect:/");
		}else{
			mav.setViewName(gotoPage);
		}
		return mav;
	}
}
