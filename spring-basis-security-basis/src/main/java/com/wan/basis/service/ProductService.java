package com.wan.basis.service;

import java.util.List;

import com.wan.basis.dto.JoinUser;
import com.wan.basis.dto.ProductDTO;

public interface ProductService {

	void Enrollment(ProductDTO dto);

	ProductDTO getProductById(int id);

	List<ProductDTO> nike_list();

	List<ProductDTO> adidas_list();

	List<ProductDTO> puma_list();

	List<ProductDTO> fila_list();

	List<ProductDTO> lacoste();


}
