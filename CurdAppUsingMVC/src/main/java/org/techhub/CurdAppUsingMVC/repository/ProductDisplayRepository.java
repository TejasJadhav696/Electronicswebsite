package org.techhub.CurdAppUsingMVC.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.CurdAppUsingMVC.model.CategoryModel;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.model.SubCatModel;
import org.techhub.CurdAppUsingMVC.model.VendorModel;

@Repository("prodisrepo")
public class ProductDisplayRepository {

	@Autowired
	JdbcTemplate template;
	
	public List<ProductModel> getMobileAccessories(String cname){
		
		List<ProductModel> list=template.query("select v.vid,v.vname,c.cid,c.cname,p.pid,p.pname,pm.price,pm.quntity,pm.magdate, pm.images, pm.Description from productmaster pm inner join vendor v on v.vid=pm.vid inner join category c on c.cid=pm.cid inner join product p on p.pid=pm.pid where c.cname='"+cname+"' ",new RowMapper<ProductModel>() {

			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel promodel=new ProductModel();
				VendorModel venmodel=new VendorModel();
				CategoryModel catmodel=new CategoryModel();
				SubCatModel submodel=new SubCatModel();
				venmodel.setId(rs.getInt(1));
				venmodel.setVendorname(rs.getString(2));
				catmodel.setId(rs.getInt(3));
				catmodel.setCategoryname(rs.getString(4));
				submodel.setId(rs.getInt(5));
				submodel.setName(rs.getString(6));
				promodel.setPrice(rs.getInt(7));
				promodel.setQuantity(rs.getInt(8));
				promodel.setDate((rs.getDate(9)).toString());
				promodel.setProurl(rs.getString(10));
				promodel.setDescription(rs.getString(11));
				promodel.setVendormodel(venmodel);
				promodel.setCatmodel(catmodel);
				promodel.setModel(submodel);
				return promodel;
			}
			
		});
		
		return list;
	}
	
}
