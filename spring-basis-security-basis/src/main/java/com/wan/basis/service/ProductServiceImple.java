package com.wan.basis.service;

import java.util.List;

import com.wan.basis.dao.ProductDAO;
import com.wan.basis.dto.JoinUser;
import com.wan.basis.dto.ProductDTO;

public class ProductServiceImple implements ProductService {
	
	private ProductDAO proDao;

	public ProductDAO getProDao() { 
		return proDao;
	}

	public void setProDao(ProductDAO proDao) {
		this.proDao = proDao;
	}

	@Override
	public void Enrollment(ProductDTO dto) {
		proDao.Enrollment(dto); 
	}

	@Override
	public ProductDTO getProductById(int id) {
		return proDao.getProductById(id);
	}
	
	@Override
	public List<ProductDTO> nike_list() {
		return proDao.nike_list();
	}

	@Override
	public List<ProductDTO> adidas_list() {
		return proDao.adidas_list();
	}

	@Override
	public List<ProductDTO> puma_list() {
		return proDao.puma_list();
	}

	@Override
	public List<ProductDTO> fila_list() {
		return proDao.fila_list();
	}

	@Override
	public List<ProductDTO> lacoste() {
		return proDao.lacoste();
	}

}
