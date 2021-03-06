package com.smilehat.business.web.sys.product;

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
import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.CertLabel;
import com.smilehat.business.entity.Product;
import com.smilehat.business.service.CategoryService;
import com.smilehat.business.service.CertLabelService;
import com.smilehat.business.service.CustomerService;
import com.smilehat.business.service.ProductService;
import com.smilehat.constants.Constants;
import com.smilehat.constants.Enums;
import com.smilehat.util.CoreUtils;

/**
 * 
 * @author yang
 *
 */
@Controller
@RequestMapping(value = Constants.SPT + SysProductController.PATH)
public class SysProductController extends BaseController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;

	@Autowired
	private CertLabelService certLabelService;

	@Autowired
	private CategoryService categoryService;

	public static final String PATH = "sys/product";
	public static final String PATH_LIST = PATH + Constants.SPT + "list";
	public static final String PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String PATH_SEARCH = PATH + Constants.SPT + "search";

	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();

		Page<Product> page = productService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return PATH_LIST;
	}

	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request) {
		Map<String, Object> searchParams = this.getSearchRequest();
		List<Product> list = productService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);

	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Product());
		model.addAttribute("action", BaseController.CREATE);

		model.addAttribute("certLabelList", getAllProductCertLabelList());
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Product product, @RequestParam(required = false) Long regionId, @RequestParam(value = "userId", required = false) Long userId,
			@RequestParam(value = "categoryId", required = false) Long categoryId, @RequestParam(value = "certLabels", required = false) String certLabels,
			@RequestParam(value = "attachIds", required = false) Long[] attachIds) {
		List<CertLabel> certLabelList = new ArrayList<>();
		if (!StringUtils.isEmpty(certLabels)) {
			String[] arr = certLabels.split(",");
			for (String str : arr) {
				Long id = Long.valueOf(str);
				certLabelList.add(certLabelService.getObjectById(id));
			}
		}

		product.setCreateTime(CoreUtils.nowtime());
		product.setUpdateTime(CoreUtils.nowtime());
		product.setPublishTime(CoreUtils.nowtime());
		productService.saveProduct(product, regionId, userId, categoryId, certLabelList, attachIds);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", productService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);

		model.addAttribute("certLabelList", getAllProductCertLabelList());
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", productService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Product product, @RequestParam(required = false) Long regionId, @RequestParam(value = "userId", required = false) Long userId,
			@RequestParam(value = "categoryId", required = false) Long categoryId, @RequestParam(value = "certLabels", required = false) String certLabels,
			@RequestParam(value = "attachIds", required = false) Long[] attachIds) {
		List<CertLabel> certLabelList = new ArrayList<>();
		if (!StringUtils.isEmpty(certLabels)) {
			String[] arr = certLabels.split(",");
			for (String str : arr) {
				Long id = Long.valueOf(str);
				certLabelList.add(certLabelService.getObjectById(id));
			}
		}
		product.setUpdateTime(CoreUtils.nowtime());
		productService.saveProduct(product, regionId, userId, categoryId, certLabelList, attachIds);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		//		productService.deleteById(id);
		Product product = productService.getObjectById(id);
		product.setIsDeleted(true);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		productService.deleteByIds(ids);
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
	public Product getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return productService.getObjectById(id);
		}
		return null;
	}

	private List<CertLabel> getAllProductCertLabelList() {
		Map<String, Object> params = new HashMap<>();
		params.put("EQ_certType", Enums.CERT_TYPE.PRODUCT.name());
		return certLabelService.findList(params);
	}

	/**
	 * 品类树
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "selectCategory")
	public String select(Model model, HttpServletRequest request) {
		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("ISNULL_parent", null);
		List<Category> category = categoryService.findAll(searchParams, "sort", "asc");
		model.addAttribute("categorylist", category);
		return "sys/product/selectCategory";
	}
}
