package com.smilehat.business.web.sys.customer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.service.CustomerService;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

/**
 * 商户审核控制器
 * @author song
 *
 */
@Controller
@RequestMapping(value = Constants.SPT + SysCustomerAuditController.PATH)
public class SysCustomerAuditController extends BaseController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private UserService userService;
	public static final String PATH = "sys/customerAudit";
	public static final String PATH_LIST = PATH + Constants.SPT + "list";
	public static final String PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String PATH_SEARCH = PATH + Constants.SPT + "search";

	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", Boolean.FALSE);
		searchParams.put("ISNULL_user.isAudit", null);
		Page<Customer> page = customerService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return PATH_LIST;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", customerService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = "audit/{id}", method = RequestMethod.POST)
	public ModelAndView update(@PathVariable("id") java.lang.Long id, @RequestParam Boolean isAudit) {
		Customer customer = customerService.getObjectById(id);
		User user = customer.getUser();
		if (isAudit) { //审核通过
			user.setAuditTime(CoreUtils.nowtime());
			user.setIsAudit(Boolean.TRUE);
			customerService.auditCustomer(customer);
		} else {
			user.setAuditTime(CoreUtils.nowtime());
			user.setIsAudit(Boolean.FALSE);
			userService.save(user);
		}
		return this.ajaxDoneSuccess("审核成功");
	}

	@ModelAttribute("preloadModel")
	public Customer getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return customerService.getObjectById(id);
		}
		return null;
	}

}
