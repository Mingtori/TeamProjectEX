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

   public List<Product> GetAllProduct(Map<String, Object> map, Paging pageInfo) {
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

   public int GetProductCount(Map<String, Object> map) {
      int cnt = 0;
      cnt = sqlSessionTemplate.selectOne(namespace + ".GetProductCount", map);
      return cnt;
   }
   
   public List<Product> getSellProducts(Paging pageInfo, Map<String, Object> map) {
      // TODO Auto-generated method stub
      List<Product> sellist = null;
      RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      sellist = sqlSessionTemplate.selectList(namespace+".getSellProducts", map, rowBounds);
      System.out.println("sellist size : " + sellist.size());
      return sellist;
   }

   public int GetSellProductsCount(Map<String, Object> map) {
      int cnt = 0;
      cnt = sqlSessionTemplate.selectOne(namespace + ".GetSellProductsCount", map);
      return cnt;
   }
   
   public int insertSellist(Product product) {
      int cnt = -1;
      cnt = sqlSessionTemplate.insert(namespace+".insertSellist", product);
      return cnt;
   }
}