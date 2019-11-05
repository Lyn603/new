package com.wan.basis.dao;

import com.wan.basis.dto.JoinUser;

public interface JoinDAO {
	
	public void insertUser(JoinUser juser);


	public void joinSuccess(String email, String checkEmail);


	public void insertUser(String email, String checkEmail);


	public String getPw(String email);


	public JoinUser allInfo(String email);

}
