package com.wan.basis.dao;

import java.util.List;

import com.wan.basis.dto.ProductDTO;

public interface ProductDAO {

	void Enrollment(ProductDTO dto);

	ProductDTO getProductById(int id);

	List<ProductDTO> nike_list();

	List<ProductDTO> adidas_list();

	List<ProductDTO> puma_list();

	List<ProductDTO> fila_list();

	List<ProductDTO> lacoste();

}
