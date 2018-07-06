// 장바구니 리스트
package cart.controller;

import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cart.model.Cart;
import cart.model.CartDao;
import member.model.Member;

@Controller
public class CartListController {

	private static final String getPage = "CartList";
	private static final String command = "/list.ct";
	
	@Autowired
	private CartDao cartdao;
	
	@RequestMapping(value=command)
	public ModelAndView doActionGet(HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		String memid = ((Member)session.getAttribute("loginfo")).getMemid();
		List<Cart> cart = cartdao.GetAllCart(memid);

		int totalprice = 0;
		for(int i = 0 ; i < cart.size(); i++){
			totalprice += cart.get(i).getCartprice();
		}

		mav.addObject("cart", cart);
		mav.addObject("totalprice", totalprice);
		mav.setViewName(getPage);
		return mav;
	}
}
