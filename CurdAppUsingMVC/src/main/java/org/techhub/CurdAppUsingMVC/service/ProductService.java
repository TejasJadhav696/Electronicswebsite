package org.techhub.CurdAppUsingMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.CurdAppUsingMVC.model.CategoryModel;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.model.SubCatModel;
import org.techhub.CurdAppUsingMVC.repository.ProductRepository;

@Service("proservice")
public class ProductService {

	@Autowired
	ProductRepository prorepo;

	public void addCategory(CategoryModel model) {
		prorepo.addCategory(model);
	}

	public List<CategoryModel> getCatrgory() {
		return prorepo.getCatrgory();
	}
	
	public List<SubCatModel> getSubCat() {
		return prorepo.getSubCat();
	}
	
	public boolean addProduct(ProductModel model) {
		return prorepo.addProduct(model);
	}
	
	public List<ProductModel> getProductInfo() {
		return prorepo.getProductInfo();
	}
	
	public void deleteProduct(Integer vid,Integer cid,Integer pid) {
		prorepo.deleteProduct(vid,cid,pid);
	}
	
	public boolean addSubCategory(SubCatModel model) {
		return prorepo.addSubCategory(model);
	}
	
	public void updateProduct(ProductModel model) {
		prorepo.updateProduct(model);
	}
	
}
