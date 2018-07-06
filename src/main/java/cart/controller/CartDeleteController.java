// 장바구니 삭제
package cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.Cart;
import cart.model.CartDao;

@Controller
public class CartDeleteController {
	
	private static final String gotoPage = "redirect:list.ct";
	private static final String command = "delete.ct";
	
	@Autowired
	public CartDao cartdao;
	
	@RequestMapping(value=command)
	public String doActionGet(@RequestParam(value="rowid", required=true) String[] rowid){
		
		int cnt = -1;
		for(int i = 0; i < rowid.length; i ++){
			if(!rowid[i].equals("")){
				Cart cart = new Cart();
				cart.setCartid(rowid[i]);
				System.out.println("rowid : " + rowid[i]);
				cnt = cartdao.DeleteCart(cart.getCartid());
			}
		}
		
		return gotoPage;
	}
}
