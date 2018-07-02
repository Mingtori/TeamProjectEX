package product.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myProductDao")
public class ProductDao {
	private final String namespace="myproduct";
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
