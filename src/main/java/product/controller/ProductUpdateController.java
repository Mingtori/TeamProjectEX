// 상품 수정(판매자)
package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import member.model.Member;
import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductUpdateController {

	private static final String getPage = "productUpdateForm";
	private static final String command = "update.prd";
	private static final String gotoPage = "redirect:list.prd";

	@Autowired
	public ProductDao productdao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(@RequestParam(value = "prodid", required = true) int prodid, Model model
			,@RequestParam(value = "seller", required = false) String seller) {
		Product bean = productdao.GetProductDetail(prodid);
		List<Product> categoryList = productdao.GetCategoryList();
		model.addAttribute("product", bean);
		model.addAttribute("categoryList", categoryList);
		if(seller!=null){
			model.addAttribute("seller", seller);
		}
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(@Valid Product product, BindingResult bindingResult
			,@RequestParam(value = "seller", required = false) String seller
			,HttpSession session) {

		String uploadPath = servletContext.getRealPath("/resources");
		MultipartFile multi = product.getUpload();
		System.out.println("///" + multi.getOriginalFilename() + "///");
		if (multi.getOriginalFilename().equals("")) {
			product.setProdimage(product.getUpload2());
		} else {
			product.setProdimage(multi.getOriginalFilename());
		}

		System.out.println(product.toString());
		int cnt = -1;
		cnt = productdao.UpdateProduct(product);

		if (cnt != -1) {
			File filepath = null;
			File filepath2 = null;
			if (!multi.getOriginalFilename().equals("")) {
				filepath = new File(uploadPath + File.separator + multi.getOriginalFilename());
				filepath2 = new File(uploadPath + File.separator + product.getUpload2());

				filepath2.delete();
			}

			try {
				if (!multi.getOriginalFilename().equals("")) {
					multi.transferTo(filepath);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(seller != null){
				return "redirect:/listSeller.prd?memid=" + ((Member)session.getAttribute("loginfo")).getMemid();
			}	
			return gotoPage;
		} else {
			return getPage;
		}
	}

}
