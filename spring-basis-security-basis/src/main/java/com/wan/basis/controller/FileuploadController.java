package com.wan.basis.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.wan.basis.dto.ProductDTO;
import com.wan.basis.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FileuploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final String PATH = "C:/eclipse-workspace/spring-basis-security-basis/spring-basis-security-basis/src/main/webapp/resources/brand_img/";
	
	@Autowired
	MappingJackson2JsonView jsonView;
	
	@Autowired
    private ProductService service;
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm() throws Exception {
		
		return "manager/upload/uploadForm";
	} 
	
	@RequestMapping(value="/upload", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request,HttpServletRequest pram,ProductDTO dto) throws Exception {
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		Iterator<String> itr =  request.getFileNames();
		
        if(itr.hasNext()) {
        	List<MultipartFile> mpf = request.getFiles(itr.next());

        	String[] array = new String[mpf.size()] ;
        	String sub_img;
            for(int i = 0; i < mpf.size(); i++) { //썸네일파일이름과 설명파일이름을 구분하여 배열에 저장
            	array[i] = System.currentTimeMillis() + ".jpg";
                File file = new File(PATH + array[i]);
                mpf.get(i).transferTo(file);//파일이 선언해준 경로로 저장이됨.
                dto.setThumbnail(array[0]); //dto에 넣어준다.
                dto.setImg(array[1]);
            }
            
            JSONObject json = new JSONObject();
            json.put("code", "true");
            model.addObject("result", json);
           
            String text = dto.getSize(); 
            
            int num = Integer.valueOf(pram.getParameter("unit")); //단위의 type을 int로 형변환
            
            String [] splits = text.split(","); //시작사이즈와 마지막사이즈를 ,를 통해 구분
            int start = Integer.valueOf(splits[0]);
            int end = Integer.valueOf(splits[1]);
            
            String size = "";
            
            for(int j=start;j<=end;j+=num) {
            	if(j==end) {
            		size= size + j;
            		break;
            	}
            	size = size + j + ",";
            } 
            
            if(pram.getParameter("who").equalsIgnoreCase("아이")) {
            	dto.setWho("kids");
            }
            else if(pram.getParameter("who").equalsIgnoreCase("여자")) {
            	dto.setWho("woman");
            }
            if(pram.getParameter("who").equalsIgnoreCase("남자")) {
            	dto.setWho("man"); 
            }
            
            dto.setSize(size);//dto에 사이즈를 넣어줌
            
            service.Enrollment(dto);//db에 업로드 내용을 올려줌
            
            return model; 
             
        } else {
        	
            JSONObject json = new JSONObject();
            json.put("code", "false");
            model.addObject("result", json);
            return model;
            
        }
	}
}
