package cart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myCartDao")
public class CartDao {
	private final String namespace = "mycart";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 장바구니 담기
	public int InsertCart(Cart cart) {
		System.out.println(cart.getCartid() + "," + cart.getCartqty());
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertCart", cart);
		return cnt;
	}

	// 장바구니 아이디 확인
	public Cart GetOneCart(String cartid) {
		System.out.println("cartid : " + cartid);
		Cart cart = null;
		cart = sqlSessionTemplate.selectOne(namespace + ".GetOneCart", cartid);
		return cart;
	}

	// 장바구니 수량 변경
	public int UpdateCartQty(Cart cart) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateCartQty", cart);
		return cnt;
	}

	// 장바구니 리스트
	public List<Cart> GetAllCart(String memid) {
		List<Cart> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetAllCart", memid);
		return list;
	}

	// 리스트 삭제
	public int DeleteCart(String cartid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteCart", cartid);
		return cnt;
	}
}
