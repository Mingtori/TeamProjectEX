package cart.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myCartDao")
public class CartDao {
	private final String namespace="mycart";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
