// 상품 리스트(판매자&관리자&일반)
package product.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductDetailController {

	private static final String getPage = "ProductDetailView";
	private static final String command = "detail.prd";

	@Autowired
	public ProductDao productdao;

	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="prodid", required = true) int prodid 
			,@RequestParam(value="pageNumber", required = false) int pageNumber
			,Model model) {
		
		Product bean = productdao.GetProductDetail(prodid);
		model.addAttribute("product", bean);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}

}
