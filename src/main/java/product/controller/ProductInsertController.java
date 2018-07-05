package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.Member;
import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductInsertController {

	private static final String getPage = "productInsertForm";
	private static final String gotoPage = "redirect:/listSeller.prd";
	private static final String command = "insert.prd";

	@Autowired
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet() {
		System.out.println("GET 방식들어옴");
		List<Product> categoryList = productDao.GetCategoryList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", categoryList);
		mav.setViewName(getPage);
		return mav;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(@Valid Product product, BindingResult bindingResult,
			HttpSession session) {
		System.out.println("POST 방식들어옴");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("bindingResult :" + bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println("유효성 검사 오류입니다");
			mav.setViewName(getPage); // ProductInsertForm.jsp
			return mav;
		}
		
		System.out.println(product);
		String uploadPath = servletContext.getRealPath("/resources");
		System.out.println(uploadPath);
		MultipartFile multi = product.getUpload();
		product.setProdimage(multi.getOriginalFilename());
		Integer cnt = -1;
		cnt = productDao.InsertProduct(product);

		if (cnt != -1) {
			mav.setViewName(gotoPage);
			File filepath = new File(uploadPath + File.separator + multi.getOriginalFilename());
			try {
				multi.transferTo(filepath);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			Member login = (Member)session.getAttribute("loginfo");
			product.setMemid(login.getMemid());
			System.out.println(login.getMemid());
			mav.addObject("memid", login.getMemid());
			productDao.insertSellist(product);
		} else {
			mav.setViewName(getPage);
		}
		return mav;
	}
}
