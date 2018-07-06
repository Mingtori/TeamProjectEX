// 주문하기(추가)
package order.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cart.model.Cart;
import cart.model.CartDao;
import order.model.Order;
import order.model.OrderDao;

@Controller
public class OrderInsertController {
	private static final String gotoPage = "redirect:/detail.ord";
	private static final String command = "insert.ord";
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CartDao cartDao;
	
	@RequestMapping(command)
	public String doActionGet(
			Cart cart){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String orderDate = dayTime.format(new Date(time));

		String[] product = cart.getCartid().split("@");
		String orderid = orderDate+"@"+cart.getCartid();
		int orderqty = cart.getCartqty();
		int prodid = Integer.parseInt(product[0]);
		Order order = new Order(orderid, orderqty, prodid);
		
		int result = orderDao.insertOrder(order);
		if(result != -1){
			cartDao.DeleteCart(cart.getCartid());
		}
		return gotoPage;
	}
}
