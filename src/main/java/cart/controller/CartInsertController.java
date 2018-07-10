// 장바구니 추가(= 장바구니 담기)
package cart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value = command)
	public String doActionGet(Cart cart, Product product, HttpSession session){
		
		int cnt = -1;
		String userid = ((Member)session.getAttribute("loginfo")).getMemid();
		String newCartid = userid + "@" + product.getProdid(); // 장바구니아이디 = 상품아이디#사용자아이디
		cart.setCartid(newCartid);
		
		Cart exCart = cartdao.GetOneCart(newCartid);
		if(exCart == null){
			cnt = cartdao.InsertCart(cart);
		}else{
			cart.setCartqty(exCart.getCartqty() + cart.getCartqty());
			cnt = cartdao.UpdateCartQty(cart);
		}
		System.out.println("cartqty : " + cart.getCartqty());
		
		return gotoPage;
	}
}
