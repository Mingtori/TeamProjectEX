package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListSellerController {
	private static final String getPage="productListSeller";
	private static final String command="listSeller.prd";
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(command)
	public ModelAndView doActionGet(
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize, 
			@RequestParam(value = "memid", required = true) String memid, 
			HttpServletRequest request){
		ModelAndView mav = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		map.put("memid", memid);
		
		// 페이징
		int totalCount = productDao.GetProductCount(map);
		String url = request.getContextPath() + "/" + this.command;
		pageSize = "9"; // 페이지당 레코드 갯수
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null, null);

		List<Product> sellist = productDao.getSellProducts(pageInfo, map);
		
		mav.addObject("sellist", sellist);
		mav.addObject( "pageInfo", pageInfo );
		mav.setViewName(getPage);
		return mav;
	}
}
