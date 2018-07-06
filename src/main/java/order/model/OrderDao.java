package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {
	private final String namespace="myorder";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 주문내역리스트
	public List<Order> getOrderList(String memid) {
		// TODO Auto-generated method stub
		List<Order> list = null;
		System.out.println(memid);
		list = sqlSessionTemplate.selectList(namespace+".getOrderList", memid);
		return list;
	}

	public int insertOrder(Order order) {
		// TODO Auto-generated method stub
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertOrder", order);
		return cnt;
	}

	public Order getOrder(String orderid) {
		// TODO Auto-generated method stub
		Order order = sqlSessionTemplate.selectOne(namespace+".getOrder", orderid);
		return order;
	}

	public int deleteOrder(String orderid) {
		// TODO Auto-generated method stub
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteOrder", orderid);
		return cnt;
	}
}
