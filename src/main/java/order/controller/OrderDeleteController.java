// 주문취소(삭제)
package order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.Member;
import order.model.OrderDao;

@Controller
public class OrderDeleteController {
	private static final String gotoPage="list.ord";
	private static final String command="delete.ord";
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam("orderid") String orderid,
			HttpSession session){
		orderDao.deleteOrder(orderid);
		
		Member member = (Member)session.getAttribute("loginfo");
		
		return gotoPage + "?memid=" + member.getMemid();
	}
}
