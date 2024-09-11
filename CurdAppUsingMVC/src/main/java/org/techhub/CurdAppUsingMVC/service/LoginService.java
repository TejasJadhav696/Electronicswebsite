package org.techhub.CurdAppUsingMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.CurdAppUsingMVC.model.LoginModel;
import org.techhub.CurdAppUsingMVC.repository.LoginRepository;

@Service("logservice")
public class LoginService {

	@Autowired
	LoginRepository logrepo;
	
	public List<LoginModel> validLogin(final LoginModel model){
		return logrepo.validLogin(model);
	}
	
}
