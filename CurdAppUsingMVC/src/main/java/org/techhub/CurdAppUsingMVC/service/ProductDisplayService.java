package org.techhub.CurdAppUsingMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.repository.ProductDisplayRepository;

@Service("prodisservice")
public class ProductDisplayService {

	@Autowired
	ProductDisplayRepository prodisrepo;
	
	public List<ProductModel> getMobileAccessories(String cname) {

		return prodisrepo.getMobileAccessories(cname);
	}
}
