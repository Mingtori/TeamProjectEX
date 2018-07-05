// 상품 리스트(판매자&관리자&일반)
package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.Board;
import board.model.BoardDao;
import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductDetailController {

	private static final String getPage = "ProductDetailView";
	private static final String command = "detail.prd";

	@Autowired
	private ProductDao productdao;
	@Autowired 
	private BoardDao boardDao;

	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value="prodid", required = true) int prodid 
			,@RequestParam(value="pageNumber", required = true) int pageNumber
			,@RequestParam(value="boardcateid", required = true) String boardcateid
			,Model model) {
		
		Product bean = productdao.GetProductDetail(prodid);
		model.addAttribute("product", bean);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("boardcateid", boardcateid);
		
		// 후기게시판 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardcateid", "p03");
		map.put("prodid", prodid);
		List<Board> lists = boardDao.getBoardLists(null,map);
		model.addAttribute("reviewlist",lists);
		
		return getPage;
	}

}
