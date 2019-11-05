package com.wan.basis.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wan.basis.dto.JoinUser;
import com.wan.basis.dto.ProductDTO;
import com.wan.basis.service.JoinService;
import com.wan.basis.service.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
    private ProductService service;
	
	@Autowired
    private JoinService Jservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	@RequestMapping(value = "/brand")
	public String brand() {
		
		return "top-menu/brand/index";
	}
	@RequestMapping("/detail")
	public ModelAndView brand_content(ProductDTO dto) 
    {
		ModelAndView mav = new ModelAndView();
		
		ProductDTO product = service.getProductById(dto.getId());
		
		String size = product.getSize(); 
		String[] sizeList = size.split(",");

		mav.setViewName("top-menu/brand/product_detail");
		mav.addObject("product", product);
		mav.addObject("sizeList", sizeList);
		mav.addObject("sizeList_length", sizeList.length-1);  
		 
        return mav; 
    } 
	@RequestMapping(value = "/nike")
	public ModelAndView brand_nike(ProductDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> nike_list = service.nike_list();
		
		mav.setViewName("top-menu/brand/product_List");
		mav.addObject("product_List", nike_list);
		mav.addObject("total", nike_list.size()); 
		mav.addObject("brand", "NIKE");
		return mav;
	}
	@RequestMapping(value = "/adidas")
	public ModelAndView brand_adidas(ProductDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> adidas_list = service.adidas_list();
		
		mav.setViewName("top-menu/brand/product_List");
		mav.addObject("product_List", adidas_list);
		mav.addObject("total", adidas_list.size()); 
		mav.addObject("brand", "ADIDAS");
		return mav;
	}
	@RequestMapping(value = "/puma")
	public ModelAndView brand_puma(ProductDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> puma_list = service.puma_list();
		
		mav.setViewName("top-menu/brand/product_List");
		mav.addObject("product_List", puma_list);
		mav.addObject("total", puma_list.size()); 
		mav.addObject("brand", "PUMA");
		return mav;
	}
	@RequestMapping(value = "/fila")
	public ModelAndView brand_fila(ProductDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> fila_list = service.fila_list();
		
		mav.setViewName("top-menu/brand/product_List");
		mav.addObject("product_List", fila_list);
		mav.addObject("total", fila_list.size()); 
		mav.addObject("brand", "FILA");
		return mav;
	}
	@RequestMapping(value = "/lacoste")
	public ModelAndView brand_lacoste(ProductDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> lacoste_list = service.lacoste();
		
		mav.setViewName("top-menu/brand/product_List");
		mav.addObject("product_List", lacoste_list);
		mav.addObject("total", lacoste_list.size()); 
		mav.addObject("brand", "LACOSTE");
		return mav;
	}
	@RequestMapping(value = "/mypage")
	public String mypage() {
		
		return "user/delivery/sweetTrackerAPI";
	}
	@RequestMapping(value = "/purchase")
	public ModelAndView purchase(JoinUser user,HttpSession session ,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String size = request.getParameter("size");//상품 사이즈
		String id = request.getParameter("id");//상품 아이디
		int getId = Integer.parseInt(id);
		ProductDTO product = service.getProductById(getId);
		
		logger.info(id);
		try {
			//로그인한 상태라면 
			JoinUser juser = (JoinUser) session.getAttribute("user");
			JoinUser allInfo = Jservice.allInfo(juser.getEmail());//로그인한 사용자의 주소 가져오기
			mav.setViewName("top-menu/brand/purchase");
			mav.addObject("allInfo",allInfo);
			mav.addObject("product",product);
			mav.addObject("size",size);
			mav.addObject("id",id);
			 
		}catch(Exception e) {
			e.getStackTrace();
			mav.setViewName("top-menu/brand/purchase_not_login");
			
			mav.addObject("size",size);
			mav.addObject("id",id);
			
			return mav;
		}
		return mav;
	}
	@RequestMapping(value = "/purchase-login-check", method = RequestMethod.POST)
	public ModelAndView purchase_login_check(HttpServletRequest request, Model model,JoinUser juser, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		String size = request.getParameter("size");//상품 사이즈
		String id = request.getParameter("id");//상품 아이디
		
		int getId = Integer.parseInt(id);
		
		String password = request.getParameter("password");
		String pw = Jservice.getPw(juser.getEmail());
		
		boolean isValidPassword = BCrypt.checkpw(password, pw);
		
		JoinUser allInfo = Jservice.allInfo(juser.getEmail());
		
		if(isValidPassword==true) {
			
			ProductDTO product = service.getProductById(getId);
			
			mav.setViewName("top-menu/brand/purchase");
			
   			mav.addObject("allInfo",allInfo);
   			mav.addObject("size",size);
			mav.addObject("product",product); 
			
   			session.setAttribute("user",allInfo);
   			
   			return mav;
		}
		else {
			String msg = "Login_Fail";
			mav.setViewName("top-menu/brand/purchase_not_login");
			mav.addObject("msg",msg);
			return mav;
		}
		
	}
	@RequestMapping(value = "/pay_result")
	public ModelAndView pay_result() {
		ModelAndView mav = new ModelAndView();
		logger.info("결제완료");
		mav.setViewName("test");
		mav.addObject("test","test");
		return mav;
	}
}