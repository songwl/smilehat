package com.smilehat.business.web.hfive.trading;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		if (this.getCurrentUser() != null) {
			model.addAttribute("vm", this.getCurrentUser().getCustomer());
		}
		return "hfive/customer/customerCenter";
	}

	@RequestMapping(value = "/centerProduct")
	public String farmCenterProduct(Model model, HttpServletRequest request) {
		return "hfive/customer/customerCenterProduct";
	}

	@RequestMapping(value = "/centerPurchase")
	public String farmCenterPurchase(Model model, HttpServletRequest request) {
		return "hfive/customer/customerCenterPurchase";
	}

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String updateCustomerForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", customerService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/customer/customerDetail";
	}

	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
	public ModelAndView updateCustomer(@Valid @ModelAttribute("preloadModel") Customer customer, @RequestParam(value = "identityAttachIds", required = false) Long[] identityAttachIds,
			@RequestParam(required = false) Long regionId, @RequestParam(value = "userAttachIds") Long[] attachIds) {
		customerService.saveCustomer(customer, identityAttachIds, attachIds, regionId, "");
		return this.ajaxDoneSuccess("修改成功");
	}

	@ModelAttribute("preloadModel")
	public Customer getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return customerService.getObjectById(id);
		}
		return null;
	}

	@RequestMapping(value = "/myProductlist")
	public String productList(Model model, HttpServletRequest request) {
		if (this.getCurrentUser() != null) {
			Map<String, Object> searchParams = Maps.newHashMap();
			searchParams.put("EQ_user.id", this.getCurrentUser().getId());
			searchParams.put("EQ_isDeleted", Boolean.FALSE);

			PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
			Page<Product> page = productService.findPage(searchParams, pageRequest);
			model.addAttribute("page", page);

		}

		return "hfive/trading/productList";
	}

	@RequestMapping(value = "/myPurchaselist")
	public String purchaseList(Model model, HttpServletRequest request) {
		if (this.getCurrentUser() != null) {
			Map<String, Object> searchParams = Maps.newHashMap();
			searchParams.put("EQ_user.id", this.getCurrentUser().getId());
			searchParams.put("EQ_isDeleted", Boolean.FALSE);

			PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
			Page<Purchase> page = purchaseService.findPage(searchParams, pageRequest);
			model.addAttribute("page", page);
		}
		return "hfive/trading/purchaseList";
	}
}
