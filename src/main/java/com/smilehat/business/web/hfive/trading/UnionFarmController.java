package com.smilehat.business.web.hfive.trading;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smilehat.business.entity.Customer;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + UnionFarmController.PATH)
public class UnionFarmController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/farm";

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/center")
	public String farmCenter(Model model, HttpServletRequest request) {
		return "hfive/farm/farmCenter";
	}

	@RequestMapping(value = "/list")
	public String farmList(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("user.createTime", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);

		Page<Customer> page = customerService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/farm/farmList";
	}

}
