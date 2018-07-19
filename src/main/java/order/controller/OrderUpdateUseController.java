package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderUpdateUseController {
	private static final String gotoPage = "redirect:/listSeller.ord";
	private static final String command = "update.ord";
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(command)
	public String doActionGet(
			Order order){
		orderDao.updateUse(order);
		return gotoPage;
	}
}
