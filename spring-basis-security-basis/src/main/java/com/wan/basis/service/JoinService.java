package com.wan.basis.service;

import com.wan.basis.dto.JoinUser;

public interface JoinService {

	public void insertUser(JoinUser juser);


	public void joinSuccess(String email, String checkEmail);


	public String getPw(String email);


	public JoinUser allInfo(String email);

	
}
