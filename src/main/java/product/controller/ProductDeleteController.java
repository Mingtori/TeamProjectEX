// 상품 삭제(판매자&관리자)
package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductDao;

@Controller
public class ProductDeleteController {

	private static final String gotoPage = "redirect:list.prd?pageNumber=";
	private static final String command = "delete.prd";
	
	@Autowired
	public ProductDao productdao;
	
	@RequestMapping(value=command)
	public String doActionGet(@RequestParam(value="prodid", required=true) int prodid
			,@RequestParam(value="pageNumber", required=true) int pageNumber){
	
		int cnt = -1;
		System.out.println("deleteController : " + prodid);
		cnt = productdao.DeleteProduct(prodid);
		
		if(cnt == -1){
			System.out.println("삭제 실패");
			return null;
		} else {
			return gotoPage + pageNumber;
		}
		
	}
	
}
