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
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.service.PurchaseService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

@Controller
@RequestMapping(value = Constants.SPT + CustomerCenterController.PATH)
public class CustomerCenterController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/customer";

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@RequestMapping(value = "/center")
	public String farmCenter(Model model, HttpServletRequest request) {
		return "hfive/customer/customerCenter";
	}

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", customerService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/customer/customerDetail";
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

	@RequestMapping(value = "/purchaselist/{userId}")
	public String purchaseList(Model model, @PathVariable Long userId) {

		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("EQ_user.id", userId);
		searchParams.put("EQ_isDeleted", Boolean.FALSE);

		PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
		Page<Purchase> page = purchaseService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/trading/purchaseList";
	}
}
