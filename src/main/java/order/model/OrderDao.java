package order.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {
	private final String namespace="myorder";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
