package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderDetailController {
	private static final String getPage="orderDetailView";
	private static final String gotoPage="delete.ord";
	private static final String command="detail.ord";
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam("orderid") String orderid,
			Model model){
		Order order = orderDao.getOrder(orderid);
		model.addAttribute("order", order);
		return getPage;
	}
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam("orderid") String orderid
			){
		return gotoPage+"?orderid=" + orderid;
	}
}
