package org.techhub.CurdAppUsingMVC.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.CurdAppUsingMVC.model.CustomerModel;
import org.techhub.CurdAppUsingMVC.model.LoginModel;

@Repository("custrepo")
public class CustomerRepository {

	@Autowired
	JdbcTemplate template;
	
	public boolean isCustomerAdd(CustomerModel model) {
	    try {
	        int val = template.update("call savecustomer(?,?,?,?,?)", 
	            model.getName(), 
	            model.getEmail(), 
	            model.getContact(),
	            model.getAddress(),
	            model.getPassword()
	        );
	        return val > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public List<CustomerModel> getCustomerData(LoginModel logmodel) {
		
		List<CustomerModel> list=template.query("select * from customermaster where cid=(select user_id from login where username=? and password=?)",new Object[]{logmodel.getUsername(),logmodel.getPassword()},new RowMapper<CustomerModel>() {
			@Override
			public CustomerModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerModel custmodel=new CustomerModel();
				custmodel.setId(rs.getInt(1));
				custmodel.setName(rs.getString(2));
				custmodel.setEmail(rs.getString(3));
				custmodel.setContact(rs.getLong(4));
				custmodel.setAddress(rs.getString(5));
				return custmodel;
			}
		});
		return list;
	}
	
	public void updateProfile(final CustomerModel model) {
		
		int val=template.update("update customermaster set cname=?,email=?,contact=?,address=? where cid=?",new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1,model.getName());
				ps.setString(2,model.getEmail());
				ps.setLong(3,model.getContact());
				ps.setString(4,model.getAddress());
				ps.setInt(5,model.getId());
				
			}
		});
		System.out.println(val>0?"Updated":"Not Updated.....!");
		
	}

}
