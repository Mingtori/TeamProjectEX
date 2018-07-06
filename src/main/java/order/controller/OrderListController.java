// 주문리스트
package order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.Order;
import order.model.OrderDao;
import product.model.ProductDao;

@Controller
public class OrderListController {
	private static final String getPage = "orderList";
	private static final String command = "list.ord";
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam("memid") String memid,
			Model model){
		List<Order> orderlist = orderDao.getOrderList("%"+memid+"%");
		model.addAttribute("orderlist", orderlist);
		return getPage;
	}
}
