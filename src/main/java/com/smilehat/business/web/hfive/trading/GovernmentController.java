package com.smilehat.business.web.hfive.trading;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + GovernmentController.PATH)
public class GovernmentController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/government";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/center")
	public String governmentCenter(Model model, HttpServletRequest request) {
		return "hfive/government/governmentCenter";
	}
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String governmentDetail(@PathVariable("id") java.lang.Long id, Model model) {
//		model.addAttribute("vm", productService.getObjectById(id));
//		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/government/governmentDetail";
	}

	@RequestMapping(value = "/catalogdetail/{id}", method = RequestMethod.GET)
	public String governmentCatalogDetail(@PathVariable("id") java.lang.Long id, Model model) {
//		model.addAttribute("vm", productService.getObjectById(id));
//		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/government/governmentCatalogDetail";
	}
}
