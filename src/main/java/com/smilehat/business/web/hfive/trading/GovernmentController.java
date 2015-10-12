package com.smilehat.business.web.hfive.trading;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Government;
import com.smilehat.business.entity.GovernmentCatalog;
import com.smilehat.business.entity.Product;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.GovernmentCatalogService;
import com.smilehat.business.service.GovernmentService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;
import com.smilehat.constants.Enums;

@Controller
@RequestMapping(value = Constants.SPT + GovernmentController.PATH)
public class GovernmentController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/government";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private GovernmentService governmentService;

	@Autowired
	private GovernmentCatalogService governmentCatalogService;
	
	@RequestMapping(value = "/center")
	public String governmentCenter(Model model, HttpServletRequest request) {
		return "hfive/government/governmentCenter";
	}
	
	@RequestMapping(value = "/list")
	public String governmentList(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("createTime", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
//		searchParams.put("EQ_isDeleted", false);

		Page<Government> page = governmentService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/government/governmentList";
	}
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String governmentDetail(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", governmentService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/government/governmentDetail";
	}
	
	@RequestMapping(value = "/cataloglist/{id}")
	public String governmentCatalogList(@PathVariable("id") java.lang.Long goverid,Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("createTime", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_government", governmentService.getObjectById(goverid));

		Page<GovernmentCatalog> page = governmentCatalogService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/government/governmentCatalogList";
	}

	@RequestMapping(value = "/catalogdetail/{id}", method = RequestMethod.GET)
	public String governmentCatalogDetail(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", governmentCatalogService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/government/governmentCatalogDetail";
	}
	
	@RequestMapping(value = "/catalog/farmList")
	public String governmentCatalogFarmList(@PathVariable("governmentCatalogId") java.lang.Long governmentCatalogId,Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("", "");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);
		//???怎么获取该政府子栏目下的农场列表？？
		
		Page<GovernmentCatalog> page=governmentCatalogService.findPage(searchParams, pageRequest); 
		model.addAttribute("page", page);

		return "hfive/farm/farmList";
	}
}
