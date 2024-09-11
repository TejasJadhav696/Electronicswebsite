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
import org.techhub.CurdAppUsingMVC.model.LoginModel;

@Repository("logrepo")
public class LoginRepository {

	@Autowired
	JdbcTemplate template;
	
	public List<LoginModel> validLogin(final LoginModel model){
		
		List<LoginModel> list=template.query("select * from login where username=? and password=?",new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getUsername());
				ps.setString(2,model.getPassword());
			}
		},new RowMapper<LoginModel>() {
			@Override
			public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				model.setLogid(rs.getInt(4));
				model.setLogtype(rs.getString(5));
				return model;
			}
		});

		return list.size()>0?list:null;
		
	}
	
}