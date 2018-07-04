package product.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myProductDao")
public class ProductDao {

	private final String namespace = "myproduct";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Product> GetCategoryList() {
		List<Product> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetCategoryList");
		return list;
	}

	public Integer InsertProduct(Product bean) {
		Integer cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertProduct", bean);
		return cnt;
	}

	public List<Product> GetProductList(Map<String, String> map) {
		List<Product> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".GetProductList", map);
		return list;
	}

	public Product GetProductDetail(int prodid) {
		Product bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetProductDetail", prodid);
		return bean;
	}

	public List<Product> GetAllProduct(Map<String, String> map, Paging pageInfo) {
		List<Product> list = null;
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace + ".GetAllProduct", map, rowBounds);
		return list;
	}

	public int DeleteProduct(int prodid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteProduct", prodid);
		return cnt;
	}

	public int UpdateProduct(Product product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".UpdateProduct", product);
		return cnt;
	}

	public int GetProductCount(Map<String, String> map) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetProductCount", map);
		return cnt;
	}

}
