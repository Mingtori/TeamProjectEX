package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberDeleteController {
	private static final String gotoListPage="redirect:/memberlist.me";
	private static final String gotoMainPage="redirect:/logout.me";
	private static final String command="delete.me";
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String doActionGet(@RequestParam("memid") String memid,
			HttpSession session){
		Member loginfo = (Member)session.getAttribute("loginfo");
		memberDao.deleteMember(memid);
		if(loginfo.getMemid().equals(memid)){
			return gotoMainPage;
		}
		return gotoListPage;
	}
}
