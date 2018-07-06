// 장바구니 수정(갯수)
package cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.Cart;
import cart.model.CartDao;

@Controller
public class CartUpdateController {
	
	private static final String gotoPage = "redirect:list.ct";
	private static final String command = "update.ct";
	
	@Autowired
	private CartDao cartdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="cartid", required=true) String cartid
			, @RequestParam(value="cartqty", required=true) int cartqty){
		
		int cnt = -1;
		
		Cart cart = new Cart();
		cart.setCartid(cartid);
		cart.setCartqty(cartqty);
		
		cnt = cartdao.UpdateCartQty(cart);
		
		if(cnt == -1){
			System.out.println("변경 실패");
		}
		
		return gotoPage;
	}
}
