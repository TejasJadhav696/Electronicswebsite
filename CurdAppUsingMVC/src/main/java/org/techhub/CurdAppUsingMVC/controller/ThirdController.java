package org.techhub.CurdAppUsingMVC.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.CurdAppUsingMVC.model.CustomerModel;
import org.techhub.CurdAppUsingMVC.model.LoginModel;
import org.techhub.CurdAppUsingMVC.model.ProductModel;
import org.techhub.CurdAppUsingMVC.service.CustomerService;
import org.techhub.CurdAppUsingMVC.service.ProductDisplayService;

@Controller
public class ThirdController {

    @Autowired
    private ProductDisplayService prodisservice;

    @Autowired
    private CustomerService custservice;

    @RequestMapping("/productlist")
    public String getMobileAccessories(@RequestParam("cname") String cname,HttpServletRequest request, HttpSession session) {
        try {
        	if(session.getAttribute("userid")!=null) {
        		List<ProductModel> list = prodisservice.getMobileAccessories(cname);
                request.setAttribute("productlist", list);
                return "ProductsPage";
        	}else {
        		return "Login";
        	}
            
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage";
        }
    }

    @RequestMapping("/profile")
    public String getProfile(HttpSession session, Map<String, Object> map) {
        LoginModel logmodel = (LoginModel) session.getAttribute("usermodel");
        if (logmodel != null) {
            try {
                List<CustomerModel> list = custservice.getCustomerData(logmodel);
                if (!list.isEmpty()) {
                    CustomerModel custmodel = list.get(0);
                    map.put("userData", custmodel);
                    return "ProfilePage";
                } else {
                    return "errorPage";
                }
            } catch (Exception e) {
                e.printStackTrace();
                return "errorPage";
            }
        } else {
            return "Login";
        }
    }
    
    @RequestMapping("/updateprofile")
    public String updateProfile(CustomerModel model) {
    	custservice.updateProfile(model);
    	return "HomePage";
    }
    

    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request,HttpSession session) {
        try {
        	session.invalidate();
            request.getSession().invalidate();
            return "Login";
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage";
        }
    }
}
