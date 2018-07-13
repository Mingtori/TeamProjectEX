package com.team.ex;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cart.model.Cart;
import cart.model.CartDao;
import member.model.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final String getPage = "home";
	private static final String command = "/"; 
	@Autowired
	private CartDao cartDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(Model model
			, HttpSession session) {
		Member login = (Member)session.getAttribute("loginfo");
		if(login != null){
			List<Cart> cartlist = cartDao.GetAllCart(login.getMemid());
			int totalprice = 0;
			for(int i = 0 ; i < cartlist.size(); i++){
				totalprice += cartlist.get(i).getCartprice();
			}
			model.addAttribute("cartlist", cartlist);
			model.addAttribute("totalprice", totalprice);
		}
		
		return getPage;
	}
	
}
