package org.techhub.CurdAppUsingMVC.repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.CurdAppUsingMVC.model.CategoryModel;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.model.SubCatModel;
import org.techhub.CurdAppUsingMVC.model.VendorModel;

@Repository("prorepo")
public class ProductRepository {

	@Autowired
	JdbcTemplate template;

	public void addCategory(final CategoryModel model) {

		int val = template.update("insert into category values('0',?)", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getCategoryname());
			}
		});
		System.out.println(val > 0 ? "Category Added....!" : "Category Not Added......!");
	}

	public List<CategoryModel> getCatrgory() {

		List<CategoryModel> list = template.query("select * from category", new RowMapper<CategoryModel>() {
			@Override
			public CategoryModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				CategoryModel model = new CategoryModel();
				model.setId(rs.getInt(1));
				model.setCategoryname(rs.getString(2));
				return model;
			}
		});
		return list.size() > 0 ? list : null;
	}

	public List<SubCatModel> getSubCat() {

		List<SubCatModel> list = template.query("select * from product", new RowMapper<SubCatModel>() {
			@Override
			public SubCatModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				SubCatModel model = new SubCatModel();
				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				return model;
			}
		});
		return list.size() > 0 ? list : null;
	}

	public boolean addProduct(final ProductModel model) {

		final Date date = Date.valueOf(model.getDate().toString());

		int val = template.update("insert into productmaster values(?,?,?,?,?,?,?,?)", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, model.getVendor());
				ps.setInt(2, model.getCategory());
				ps.setInt(3, model.getProduct());
				ps.setInt(4, model.getPrice());
				ps.setInt(5, model.getQuantity());
				ps.setDate(6, date);
				ps.setString(7,model.getProurl());;
				ps.setString(8,model.getDescription());
			}

		});

		return val > 0 ? true : false;
	}

	public List<ProductModel> getProductInfo() {

		List<ProductModel> list = template.query(
				"select v.vid,v.vname,c.cid,c.cname,p.pid,p.pname,pm.price,pm.quntity,pm.magdate from productmaster pm inner join vendor v on v.vid=pm.vid inner join category c on c.cid=pm.cid inner join product p on p.pid=pm.pid",
				new RowMapper<ProductModel>() {

					@Override
					public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
						ProductModel promodel = new ProductModel();
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
						promodel.setVendormodel(venmodel);
						promodel.setCatmodel(catmodel);
						promodel.setModel(submodel);
						return promodel;
					}

				});

		return list.size() > 0 ? list : null;
	}
	
	public void deleteProduct(final Integer vid,final Integer cid,final Integer pid) {
		int val=template.update("delete from productmaster where vid=? and cid=? and pid=?",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,vid);
				ps.setInt(2, cid);
				ps.setInt(3, pid);
			}
		});
		System.out.println(val>0?"Delete":"Not Delete");
	}
	
	public boolean addSubCategory(final SubCatModel model) {
		int val=template.update("insert into product values('0',?)",new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1,model.getName());
			}
			
		});
		
		return val>0?true:false;
	}
	
	public void updateProduct(final ProductModel model) {
		
		int val=template.update("update productmaster set price=?,quntity=?,magdate=? where vid=? and cid=? and pid=?",new PreparedStatementSetter() {

			final Date date = Date.valueOf(model.getDate().toString());
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,model.getPrice());
				ps.setInt(2,model.getQuantity());
				ps.setDate(3, date);
				ps.setInt(4,model.getVendor());
				ps.setInt(5,model.getCategory());
				ps.setInt(6, model.getProduct());
			}
		});
		
		System.out.println(val>0?"Updated":"Not Updated");
		
	}

}
