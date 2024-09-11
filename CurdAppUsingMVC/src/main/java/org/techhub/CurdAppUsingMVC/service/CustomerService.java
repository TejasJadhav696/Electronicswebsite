package org.techhub.CurdAppUsingMVC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.CurdAppUsingMVC.model.CustomerModel;
import org.techhub.CurdAppUsingMVC.model.LoginModel;
import org.techhub.CurdAppUsingMVC.repository.CustomerRepository;
import java.util.*;

@Service("custservice")
public class CustomerService {
	
	@Autowired
	CustomerRepository custrepo;
	
	public boolean isCustomerAdd(CustomerModel model) {
		return custrepo.isCustomerAdd(model);
	}
	
	public List<CustomerModel> getCustomerData(LoginModel logmodel) {
		return custrepo.getCustomerData(logmodel);
	}
	
	public void updateProfile(CustomerModel model) {
		custrepo.updateProfile(model);
	}
	
}
