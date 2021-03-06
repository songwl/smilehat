package com.smilehat.business.web.sys.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
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
import com.smilehat.business.entity.CertLabel;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.service.CertLabelService;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.service.PurchaseService;
import com.smilehat.constants.Constants;
import com.smilehat.constants.Enums;
import com.smilehat.util.CoreUtils;

/**
 * 
 * @author song
 *
 */
@Controller
@RequestMapping(value = Constants.SPT + SysCustomerController.PATH)
public class SysCustomerController extends BaseController {

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private CertLabelService certLabelService;

	public static final String PATH = "sys/customer";
	public static final String PATH_LIST = PATH + Constants.SPT + "list";
	public static final String PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String PATH_SEARCH = PATH + Constants.SPT + "search";
	public static final String PATH_SELECT = PATH + "/select";

	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", Boolean.FALSE);
		searchParams.put("EQ_user.isAudit", Boolean.TRUE);
		Page<Customer> page = customerService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return PATH_LIST;
	}

	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request) {
		Map<String, Object> searchParams = this.getSearchRequest();
		List<Customer> list = customerService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);

	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Customer());
		model.addAttribute("action", BaseController.CREATE);
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Customer customer, @RequestParam(value = "identityAttachIds", required = false) Long[] identityAttachIds, @RequestParam(required = false) Long regionId,
			@RequestParam(value = "attachIds", required = false) Long[] attachIds,@RequestParam(value = "color", required = false) String backgroundColor) {
		customerService.createCustomer(customer, identityAttachIds, attachIds, regionId,backgroundColor);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		Customer vm = customerService.getObjectById(id);
		model.addAttribute("vm", vm);
		model.addAttribute("action", BaseController.UPDATE);

		model.addAttribute("certLabelList", getUserCertLabelList(vm.getUser().getUserType()));
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", customerService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Customer customer, @RequestParam(value = "identityAttachIds", required = false) Long[] identityAttachIds,
			@RequestParam(required = false) Long regionId, @RequestParam(value = "attachIds", required = false) Long[] attachIds,
			@RequestParam(value = "certLabels", required = false) String certLabels,@RequestParam(value = "color", required = false) String backgroundColor) {
		List<CertLabel> certLabelList = new ArrayList<>();
		if (!StringUtils.isEmpty(certLabels)) {
			String[] arr = certLabels.split(",");
			for (String str : arr) {
				Long id = Long.valueOf(str);
				certLabelList.add(certLabelService.getObjectById(id));
			}
			customer.getUser().setLabels(certLabelList);
		}

		customerService.saveCustomer(customer, identityAttachIds, attachIds, regionId,backgroundColor);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		customerService.deleteCustomer(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		customerService.deleteCustomers(ids);
		return this.ajaxDoneSuccess("删除成功");
	}

	/**
	 *  高级查询界面
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "search")
	public String search(HttpServletRequest request) {
		return PATH_SEARCH;
	}

	@ModelAttribute("preloadModel")
	public Customer getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return customerService.getObjectById(id);
		}
		return null;
	}

	@RequestMapping(value = "product/list/{userId}")
	public String productList(Model model, @PathVariable Long userId) {

		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("EQ_user.id", userId);
		searchParams.put("EQ_isDeleted", Boolean.FALSE);

		PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
		Page<Product> page = productService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "sys/customer/productList";
	}

	@RequestMapping(value = "purchase/list/{userId}")
	public String purchaseList(Model model, @PathVariable Long userId) {

		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("EQ_user.id", userId);
		searchParams.put("EQ_isDeleted", Boolean.FALSE);

		PageRequest pageRequest = CoreUtils.buildPageRequest(1, 20, "visitCount,publishTime", "desc,desc");
		Page<Purchase> page = purchaseService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "sys/customer/purchaseList";
	}

	/**
	 * 商户
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "select")
	public String select(Model model, HttpServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("user.registerDate", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);//所有未删除的商户，false未删除，true
		searchParams.put("EQ_user.isAudit", Boolean.TRUE);

		Page<Customer> page = customerService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return PATH_SELECT;
	}

	private List<CertLabel> getUserCertLabelList(String userType) {
		Map<String, Object> params = new HashMap<>();
		params.put("EQ_certType", Enums.CERT_TYPE.CUSTOMER.name());
		params.put("EQ_certType2", userType);
		return certLabelService.findList(params);
	}

}
