package org.techhub.CurdAppUsingMVC.controller;

import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.techhub.CurdAppUsingMVC.model.CustomerModel;
import org.techhub.CurdAppUsingMVC.model.LoginModel;
import org.techhub.CurdAppUsingMVC.model.VendorModel;
import org.techhub.CurdAppUsingMVC.service.CustomerService;
import org.techhub.CurdAppUsingMVC.service.LoginService;
import org.techhub.CurdAppUsingMVC.service.VendorService;

@Controller
public class HomeController {

	@Autowired
	private LoginService logservice;

	@Autowired
	private CustomerService custservice;

	@Autowired
	private VendorService vendorserv;

	@RequestMapping(value = "/")
	public ModelAndView test() {
		return new ModelAndView("HomePage");
	}
	
	@RequestMapping("/home")
	public String getHomepage() {
		return "HomePage";
	}

	@RequestMapping("/adminpage")
	public String getDashboard() {
		return "AdminPage";
	}

	@RequestMapping("/login")
	public String getLogin() {
		return "Login";
	}

	@RequestMapping("/log")
	public String loginProcess(LoginModel model, Map<String, String> map, HttpSession session) {
		List<LoginModel> list = logservice.validLogin(model);
		if (list != null && !list.isEmpty()) {
			model = list.get(0);
			if ("SuperAdmin".equals(model.getLogtype())) {
				return "AdminPage";
			} else if ("customer".equals(model.getLogtype())) {
				session.setAttribute("userid", model.getLogid());
				session.setAttribute("usermodel", model);
				return "HomePage";
			}
		}
		map.put("mass", "Invalid UserName & Password");
		return "Login";
	}

	@RequestMapping("/signup")
	public String getSignUp() {
		return "Signup";
	}

	@RequestMapping("/custdata")
	public String getData(CustomerModel model, Map<String, String> map) {
		boolean isAdded = custservice.isCustomerAdd(model);
		map.put("msg", isAdded ? "Register Successfully." : "Not Register!");
		return "Login";
	}

	@RequestMapping("/add_vendor")
	public String addVendor() {
		return "AddVendor";
	}

	@RequestMapping("/addvendor")
	public String addVendor(VendorModel model, Map<String, String> map) {
		boolean isAdded = vendorserv.isAddVendor(model);
		map.put("msg", isAdded ? "Vendor Added Successfully." : "Vendor not Added.");
		return "AddVendor";
	}

	@RequestMapping("/viewvendor")
	public String viewVendor(Map<String, List<VendorModel>> map) {
		map.put("data", vendorserv.getVendorList());
		return "ViewVendor";
	}

	@RequestMapping("/delete")
	public String deleteVendor(@RequestParam("id") int id, Map<String, List<VendorModel>> map) {
		vendorserv.deleteVendor(id);
		map.put("data", vendorserv.getVendorList());
		return "ViewVendor";
	}

	@RequestMapping("/update")
	public String updateVendor(@RequestParam("id") int id, @RequestParam("n") String name, 
							   @RequestParam("iso") int isoNo, Map<String, VendorModel> map) {
		VendorModel model = new VendorModel();
		model.setId(id);
		model.setVendorname(name);
		model.setIosno(isoNo);
		map.put("model", model);
		return "AddVendor";
	}
	
	@RequestMapping("/searchvendor")
	@ResponseBody
	public String searchVendor(@RequestParam("n") String n) {
		List<VendorModel> list = vendorserv.searchVendor(n);
		String str = "";
		str += "<table class='table table-striped table-bordered'>";
		str += "<tr><th>ID</th><th>NAME</th><th>ISO Number</th><th>Action</th></tr>";
		int id = 0;
		for (VendorModel model : list) {
			str += "<tr>";
			str += "<td>" + ++id + "</td>";
			str += "<td>"+model.getVendorname()+"</td>";
			str += "<td>"+model.getIosno()+"</td>";
			str += "<td><a href='update?n=" + model.getVendorname() + "&iso=" + model.getIosno() + "&id="
					+ model.getId() + "' class='btn btn-warning btn-sm' >update</a>";
			str += "<a href='delete?id=" + model.getId() + "' class='btn btn-danger btn-sm'>delete</a></td>";
			str += "</tr>";
		}
		str += "</table>";
		return str;
	}	
}


