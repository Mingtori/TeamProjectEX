package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberListController {
	private static final String getPage="memberList";
	private static final String command="memberlist.me";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String doActionGet(Model model){
		System.out.println(this.getClass()); 
		List<Member> memberlist = memberDao.getMemberList();
		model.addAttribute("memberlist", memberlist);
		
		return getPage;
	}
}
