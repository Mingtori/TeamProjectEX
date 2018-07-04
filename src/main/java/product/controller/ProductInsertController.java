package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import product.model.Product;
import product.model.ProductDao;

@Controller
public class ProductInsertController {

	private static final String getPage = "productRegisterForm";
	private static final String gotoPage = "redirect:list.prd";
	private static final String command = "insert.prd";

	@Autowired
	private ProductDao productDao;

	@Autowired
	ServletContext servletContext;

	
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doActionGet() {
		System.out.println("GET ��ĵ���");
		List<Product> categoryList = productDao.GetCategoryList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoryList", categoryList);
		mav.setViewName(getPage);
		return mav;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(@Valid Product product, BindingResult bindingResult) {
		System.out.println("POST ��ĵ���");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("bindingResult :" + bindingResult);
		
		if (bindingResult.hasErrors()) {
			System.out.println("��ȿ�� �˻� �����Դϴ�");
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
		} else {
			mav.setViewName(getPage);
		}
		return mav;
	}
}
