package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.Member;
import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderSellListController {
	private static final String getPage = "orderListSeller";
	private static final String command = "listSeller.ord";
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(command)
	public String doActionGet(HttpSession session, Model model){
		Member login = (Member)session.getAttribute("loginfo");
		List<Order> orderlist = orderDao.getOrderSellList(login);
		
		model.addAttribute("orderlist", orderlist);
		return getPage;
	}
}
