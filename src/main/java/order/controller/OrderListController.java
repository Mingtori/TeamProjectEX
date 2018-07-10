// 주문리스트
package order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.Order;
import order.model.OrderDao;

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
		List<List<Order>> orderlists = new ArrayList<List<Order>>(); 
		List<String> order = orderDao.getOrderIds("%"+memid+"%");
		for(String str : order){
			List<Order> list = orderDao.getOrderList(str+"%");
			orderlists.add(list);
		}
		
		model.addAttribute("orderlists", orderlists);
		return getPage;
	}
}
