package order.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {
	private final String namespace="myorder";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 주문내역리스트
	public List<Order> getOrderList(String str) {
		// TODO Auto-generated method stub
		List<Order> list = null;
		System.out.println(str);
		list = sqlSessionTemplate.selectList(namespace+".getOrderList", str);
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

	public List<String> getOrderIds(String memid) {
		// TODO Auto-generated method stub
		System.out.println("memid : " +memid);
		List<String> list = null;
		list = sqlSessionTemplate.selectList(namespace+".getOrderIds", memid);
		System.out.println("listsize : " + list.size());
		return list;
	}
}
