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

import com.google.common.collect.Maps;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Product;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;
import com.smilehat.constants.Enums;
import com.smilehat.util.CoreUtils;

@Controller
@RequestMapping(value = Constants.SPT + UnionFarmController.PATH)
public class UnionFarmController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/farm";

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/center")
	public String farmCenter(Model model, HttpServletRequest request) {
		return "hfive/farm/farmCenter";
	}

	@RequestMapping(value = "/list")
	public String farmList(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("user.createTime", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);
		searchParams.put("EQ_user.isAudit", Boolean.TRUE);
		searchParams.put("EQ_user.isDeleted", false);
		searchParams.put("EQ_user.userType", Enums.USER_TYPE.FARMER.name());

		Page<Customer> page = customerService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/farm/farmList";
	}

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		Customer vm = customerService.getObjectById(id);
		model.addAttribute("vm", vm);
		model.addAttribute("action", BaseController.UPDATE);

		model.addAttribute("userCategorys", productService.findCategoryListByProductUser(vm.getUser().getId()));
		return "hfive/farm/farmDetail";
	}

	@RequestMapping(value = "/productlist/{userId}")
	public String productList(Model model, @PathVariable Long userId) {

		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("EQ_user.id", userId);
		searchParams.put("EQ_isDeleted", Boolean.FALSE);

		PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
		Page<Product> page = productService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/trading/productList";
	}

}
