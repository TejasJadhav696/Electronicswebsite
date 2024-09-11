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
import org.techhub.CurdAppUsingMVC.model.VendorModel;

@Repository("vendorrepo")
public class VendorRepository {

	@Autowired
	JdbcTemplate template;

	public boolean isAddVendor(VendorModel model) {

		int val = template.update("insert into vendor values('0',?,?)", model.getVendorname(), model.getIosno());

		return val > 0 ? true : false;

	}

	public List<VendorModel> getVendorList() {

		List<VendorModel> list = template.query("select * from vendor", new RowMapper<VendorModel>() {

			@Override
			public VendorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				VendorModel model = new VendorModel();
				model.setId(rs.getInt(1));
				model.setVendorname(rs.getString(2));
				model.setIosno(rs.getInt(3));
				return model;
			}

		});

		return list.size() > 0 ? list : null;

	}

	public void deleteVendor(int id) {
		template.update("delete from vendor where vid=" + id);
	}

	public void updateVendor(final VendorModel model) {

		template.update("update vendor vname=?,iosno=? where vid=?", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getVendorname());
				ps.setInt(2, model.getIosno());
				ps.setInt(3, model.getId());
			}
		});

	}
	
	public List<VendorModel> searchVendor(String n){
		
		List<VendorModel> list=template.query("select * from vendor where vname like '%"+n+"%' ",new RowMapper<VendorModel>() {

			@Override
			public VendorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				VendorModel model=new VendorModel();
				model.setId(rs.getInt(1));
				model.setVendorname(rs.getString(2));
				model.setIosno(rs.getInt(3));
				return model;
			}
			
		});
		
		return list;
	}

}
