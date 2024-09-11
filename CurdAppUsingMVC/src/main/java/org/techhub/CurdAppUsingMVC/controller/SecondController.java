package org.techhub.CurdAppUsingMVC.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.CurdAppUsingMVC.model.CategoryModel;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.model.SubCatModel;
import org.techhub.CurdAppUsingMVC.service.ProductService;
import org.techhub.CurdAppUsingMVC.service.VendorService;

@Controller
public class SecondController {
	
	@Autowired
	VendorService vendorserv;
	@Autowired
	ProductService proservice;
	
	@RequestMapping("/add_product")
	public String addProduct(Map map) {
		map.put("vendordata",vendorserv.getVendorList());
		map.put("categorydata", proservice.getCatrgory());
		map.put("subcatdata", proservice.getSubCat());
		return "AddProduct";
	}
	
	@RequestMapping("/add_category")
	public String catrgoryPage() {
		return "AddCategory";
	}
	@RequestMapping("/addcategory")
	public String addCategory(CategoryModel model,Map map) {
		proservice.addCategory(model);
		map.put("vendordata",vendorserv.getVendorList());
		map.put("categorydata", proservice.getCatrgory());
		map.put("subcatdata", proservice.getSubCat());
		return "AddProduct";
	}
	
	@RequestMapping("/subcategory")
	public String subCategory() {
		return "SubCategoryPage";
	}
	
	@RequestMapping("/addsubcategory")
	public String AddSubCategory(SubCatModel model,Map map) {
		boolean b=proservice.addSubCategory(model);
		if(b) {
		map.put("vendordata",vendorserv.getVendorList());
		map.put("categorydata", proservice.getCatrgory());
		map.put("subcatdata", proservice.getSubCat());
		return "AddProduct";
		}else {
			return "SubCategoryPage";
		}
	}
	
	@RequestMapping("/addproduct")
	public String AddProduct(ProductModel promodel,Map map) {
		boolean result=proservice.addProduct(promodel);
		if(result) {
			map.put("msg","Product Added");
			map.put("vendordata",vendorserv.getVendorList());
			map.put("categorydata", proservice.getCatrgory());
			map.put("subcatdata", proservice.getSubCat());
		}else {
			map.put("msg","Product NOT Added");
		}
		return "AddProduct";
	}
	
	@RequestMapping("/viewproduct")
	public String getProductInfo(HttpServletRequest request) {
		List<ProductModel> list=proservice.getProductInfo();
		if(list.size()>0) {
			request.setAttribute("productdata", list);
			return "ViewProduct";
			
		}else {
			return "AddProduct";
		}
	}
	
	@RequestMapping("/delproduct")
	public String deleteProduct(HttpServletRequest request,@RequestParam("vid") Integer vid,@RequestParam("cid") Integer cid,@RequestParam("pid") Integer pid) {
		proservice.deleteProduct(vid,cid,pid);
		List<ProductModel> list=proservice.getProductInfo();
		request.setAttribute("productdata", list);
		return "ViewProduct";
	}
	
	@RequestMapping("/updproduct")
	public String updateProduct(Map map,@RequestParam("vid") Integer vid,@RequestParam("cid") Integer cid,@RequestParam("pid") Integer pid,@RequestParam("pp") Integer pp,@RequestParam("pq") Integer pq,@RequestParam("pd") String pd) {
		ProductModel model=new ProductModel();
		model.setVendor(vid);
		model.setCategory(cid);
		model.setProduct(pid);
		model.setPrice(pp);
		model.setQuantity(pq);
		model.setDate(pd);
		map.put("updpro", model);
		return "UpdateProduct";
	}
	
	@RequestMapping("/updateproduct")
	public String isUpdateProduct(ProductModel model,HttpServletRequest request) {
		proservice.updateProduct(model);
		List<ProductModel> list=proservice.getProductInfo();
		request.setAttribute("productdata", list);
		return "ViewProduct";
	}
	
}
