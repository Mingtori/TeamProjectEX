// 상품 리스트(판매자&관리자&일반)
package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListController {

	private static final String getPage = "ProductList";
	private static final String command = "list.prd";

	@Autowired
	public ProductDao productdao;

	@RequestMapping(value = command)
	public ModelAndView doActionGet(@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");

		// 페이징
		int totalCount = productdao.GetProductCount(map);
		String url = request.getContextPath() + "/" + this.command;
		pageSize = "9"; // 페이지당 레코드 갯수
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);

		List<Product> product = productdao.GetAllProduct(map, pageInfo);
		
		mav.addObject("product", product);
		mav.addObject( "pageInfo", pageInfo );
		mav.setViewName(getPage);
		return mav;
	}
}
