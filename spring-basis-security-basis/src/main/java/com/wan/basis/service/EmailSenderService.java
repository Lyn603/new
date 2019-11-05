package com.wan.basis.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.wan.basis.controller.HomeController;
import com.wan.basis.dao.JoinDAO;

public class EmailSenderService {
    
    @Autowired
    protected JavaMailSender mailSender;

    @Autowired
	public SqlSessionTemplate sqlSession;
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
	public boolean lowerCheck;
	
	public int size;
	
	public String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			}
			else {
				continue;
				}
		}
		while (sb.length() < size);
		
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
    public String SendEmail(String email, String name, HttpServletRequest request) throws Exception{
    	String checkEmail = getKey(false, 20);
    	String user = "yn060312@gmail.com"; 
        String password = "dbsk060312"; 

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            	protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        
        logger.info("checkEmail : "+checkEmail);
        
		String htmlStr = "<h2>안녕하세요!</h2><br><br>" 
				+ "<h3>" + name + "님</h3>" + "<p>회원가입을 진심으로 축하드립니다. 메일 인증 버튼을 클릭해주세요! : " 
				+ "<a href='http://localhost:8089" + request.getContextPath()
				+ "/key_alter?email="+ email +"&checkEmail="+checkEmail+"'>클릭!</a></p>";
		
        try {

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            
            
            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            // 제목
            message.setSubject("[이메일 인증] SHOES CUSTOM 이메일 인증을 해주세요!", "UTF-8");

            // 내용
            message.setText(htmlStr, "UTF-8", "HTML");
            
            // 전송
            Transport.send(message); 
            
            System.out.println("message sent successfully...");
            
           
        } catch (AddressException e) {
        	
            e.printStackTrace();
        } catch (MessagingException e) {
        	
            e.printStackTrace();
        }
        return checkEmail;
    }

 
}
