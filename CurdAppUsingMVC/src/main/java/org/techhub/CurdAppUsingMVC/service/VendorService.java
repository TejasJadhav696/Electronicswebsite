package org.techhub.CurdAppUsingMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.CurdAppUsingMVC.model.VendorModel;
import org.techhub.CurdAppUsingMVC.repository.VendorRepository;

@Service("vendorserv")
public class VendorService {

	@Autowired
	VendorRepository vendorrepo;

	public boolean isAddVendor(VendorModel model) {

		return vendorrepo.isAddVendor(model);

	}

	public List<VendorModel> getVendorList() {
		return vendorrepo.getVendorList();
		
	}

	public void deleteVendor(int id) {
		vendorrepo.deleteVendor(id);
	}
	
	public void updateVendor(VendorModel model) {
		vendorrepo.updateVendor(model);
	}
	
	public List<VendorModel> searchVendor(String n){
		return vendorrepo.searchVendor(n);
	}
	
}
