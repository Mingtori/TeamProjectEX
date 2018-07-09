// 주문하기(추가)
package order.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.Cart;
import cart.model.CartDao;
import member.model.Member;
import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderInsertController {
	private static final String gotoPage = "redirect:/list.ord";
	private static final String command = "insert.ord";
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CartDao cartDao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam("rowid") String[] cartid,
			HttpSession session){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String orderDate = dayTime.format(new Date(time));

		for(String cart : cartid){
			if(cart.equals("")){
				continue;
			}
			Cart getCart = cartDao.GetOneCart(cart); 
			String[] product = cart.split("@");
			String orderid = orderDate+"@"+cart;
			int orderqty = getCart.getCartqty();
			int prodid = Integer.parseInt(product[0]);
			Order order = new Order(orderid, orderqty, prodid);
			
			int result = orderDao.insertOrder(order);
			if(result != -1){
				cartDao.DeleteCart(cart);
			}
		}
		return gotoPage+"?memid="+ ((Member)session.getAttribute("loginfo")).getMemid();
	}
}
