package com.smilehat.business.web.hfive.trading;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Maps;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.service.CategoryService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.service.PurchaseService;
import com.smilehat.business.web.hfive.HfiveBaseController;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

@Controller
@RequestMapping(value = Constants.SPT + TradingCenterController.PATH)
public class TradingCenterController extends HfiveBaseController {

	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/trading";

	@Autowired
	private ProductService productService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = { "", "/product/center" })
	public String productCenter(Model model, HttpServletRequest request) {
		return "hfive/trading/productCenter";
	}

	@RequestMapping(value = "/product/list")
	public String productList(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("publishTime", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);

		Page<Product> page = productService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/trading/productList";
	}

	@RequestMapping(value = "/product/detail/{id}", method = RequestMethod.GET)
	public String productDetail(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", productService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/trading/productDetail";
	}

	@RequestMapping(value = "/purchase/center")
	public String purchaseCenter(Model model, HttpServletRequest request) {
		return "hfive/trading/purchaseCenter";
	}

	@RequestMapping(value = "/purchase/list")
	public String purchaseList(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("publishTime", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		searchParams.put("EQ_isDeleted", false);

		Page<Purchase> page = purchaseService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return "hfive/trading/purchaseList";
	}

	@RequestMapping(value = "/purchase/detail/{id}", method = RequestMethod.GET)
	public String purchaseDetail(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", purchaseService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "hfive/trading/purchaseDetail";
	}

	@RequestMapping(value = "/product/publish/new")
	public String productPublishForm(Model model, HttpServletRequest request) {
		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("ISNULL_parent", null);
		List<Category> category = categoryService.findAll(searchParams, "sort", "asc");
		model.addAttribute("categorylist", category);
		return "hfive/trading/productPublish";
	}

	@RequestMapping(value = "/product/publish/save")
	public ModelAndView productPublish(@Valid Product product, @RequestParam(required = false) Long regionId, @RequestParam(value = "categoryId", required = false) Long categoryId) {
		product.setCreateTime(CoreUtils.nowtime());
		product.setUpdateTime(CoreUtils.nowtime());
		product.setPublishTime(CoreUtils.nowtime());
		productService.saveProduct(product, regionId, this.getCurrentUser().getId(), categoryId);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = "/purchase/publish/new")
	public String purchasePublishForm(Model model, HttpServletRequest request) {
		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("ISNULL_parent", null);
		List<Category> category = categoryService.findAll(searchParams, "sort", "asc");
		model.addAttribute("categorylist", category);
		return "hfive/trading/purchasePublish";
	}

	@RequestMapping(value = "/purchase/publish/save")
	public ModelAndView purchasePublish(@Valid Purchase purchase, @RequestParam(value = "categoryId", required = false) Long categoryId) {
		purchase.setCreateTime(CoreUtils.nowtime());
		purchase.setUpdateTime(CoreUtils.nowtime());
		purchase.setPublishTime(CoreUtils.nowtime());
		purchaseService.savePurchase(purchase, this.getCurrentUser().getId(), categoryId);
		return this.ajaxDoneSuccess("创建成功");
	}
}
