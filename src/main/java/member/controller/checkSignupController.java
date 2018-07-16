package member.controller;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class checkSignupController {

	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value="/checkSignup.me",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> doActionPost(
			@RequestBody String userid
			){
	
		  System.out.println("id:"+userid);
	      int count = 0;
	      count = memberDao.checkSignup(userid);
	      System.out.println("count:"+count);
	      Map<Object, Object> map = new HashMap<Object, Object>();
    	  map.put("cnt", count);
    	  System.out.println("map size : " + map.size());
	      return map;
	}
}
