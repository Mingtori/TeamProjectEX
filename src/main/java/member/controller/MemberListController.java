package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberListController {
	private static final String getPage="memberList";
	private static final String command="memberlist.me";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(Model model,
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword){
		System.out.println(this.getClass()); 
		
		getList(model,whatColumn,keyword);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(Model model,
			@RequestParam("memid") String memid){
		memberDao.updatePermit(memid);
		getList(model,null,null);
		
		return getPage;
	}
	
	public void getList(Model model,String whatColumn,String keyword){
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		List<Member> memberlist = memberDao.getMemberList(map);
		model.addAttribute("memberlist", memberlist);
	}
}
