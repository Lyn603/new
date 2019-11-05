package com.wan.basis.service;


import com.wan.basis.dao.JoinDAO;
import com.wan.basis.dto.JoinUser;

public class JoinServiceImpl implements JoinService {
	private JoinDAO dao;
	
	public JoinDAO getDao() {
		return dao;
	}

	public void setDao(JoinDAO dao) {
		this.dao = dao;
	}


	@Override
	public void insertUser(JoinUser juser) {
		dao.insertUser(juser);
	}

	@Override
	public void joinSuccess(String email, String checkEmail) {
		dao.insertUser(email,checkEmail);
	}

	@Override
	public String getPw(String email) {
		return dao.getPw(email);
	}

	@Override
	public JoinUser allInfo(String email) {
		return dao.allInfo(email);
	}


	
}
