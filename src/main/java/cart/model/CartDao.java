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

	// ��ٱ��� ���
	public int InsertCart(Cart cart) {
		System.out.println(cart.getCartid() + "," + cart.getCartqty());
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertCart", cart);
		return cnt;
	}

	// ��ٱ��� ���̵� Ȯ��
	public Cart GetOneCart(String cartid) {
		System.out.println("cartid : " + cartid);
		Cart cart = null;
		cart = sqlSessionTemplate.selectOne(namespace + ".GetOneCart", cartid);
		return cart;
	}

	// ��ٱ��� ���� ����
	public int UpdateCartQty(Cart cart) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateCartQty", cart);
		return cnt;
	}

	// ��ٱ��� ����Ʈ
	public List<Cart> GetAllCart(String memid) {
		List<Cart> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetAllCart", memid);
		return list;
	}

	// ����Ʈ ����
	public int DeleteCart(String cartid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteCart", cartid);
		return cnt;
	}
}
