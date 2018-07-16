// ��ٱ��� �߰�(= ��ٱ��� ���)
package cart.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cart.model.Cart;
import cart.model.CartDao;
import member.model.Member;
import product.model.Product;

@Controller
public class CartInsertController {
	
	private static final String gotoPage = "redirect:list.ct";
	private static final String command = "insert.ct";
	
	@Autowired
	private CartDao cartdao;
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public void doActionGet(Cart cart, Product product, HttpSession session, HttpServletResponse response){
		
		System.out.println("Cartqtykids :" + cart.getCartqtykids());
		int cnt = -1;
		String userid = ((Member)session.getAttribute("loginfo")).getMemid();
		String newCartid = userid + "@" + product.getProdid(); // ��ٱ��Ͼ��̵� = ��ǰ���̵�#����ھ��̵�
		cart.setCartid(newCartid);
		
		Cart exCart = cartdao.GetOneCart(newCartid);
		if(exCart == null){
			cnt = cartdao.InsertCart(cart);
		}else{
			cart.setCartqty(exCart.getCartqty() + cart.getCartqty());
			cnt = cartdao.UpdateCartQty(cart);
		}
		System.out.println("cartqty : " + cart.getCartqty());
	}
}
