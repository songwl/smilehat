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
		model.addAttribute("categoryList", productService.findCategoryListByProduct());
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
		model.addAttribute("categoryList", productService.findCategoryListByProduct());
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
	public ModelAndView productPublish(@Valid Product product, PublishForm form, @RequestParam(value = "regionId", required = false) Long regionId,
			@RequestParam(value = "categoryId", required = false) Long categoryId, @RequestParam(value = "attachIds", required = false) Long[] attachIds) {
		product.setStartTime(form.getStartMonthDay1());
		product.setEndTime(form.getEndMonthDay1());
		product.setStartTime2(form.getStartMonthDay2());
		product.setEndTime2(form.getEndMonthDay2());

		product.setCreateTime(CoreUtils.nowtime());
		product.setUpdateTime(CoreUtils.nowtime());
		product.setPublishTime(CoreUtils.nowtime());

		if (this.getCurrentUser() != null) {
			productService.saveProduct(product, regionId, this.getCurrentUser().getId(), categoryId, null, attachIds);
			return this.ajaxDoneSuccess("创建成功");
		} else {
			return this.ajaxDoneError("请登录！");
		}

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
	public ModelAndView purchasePublish(@Valid Purchase purchase, @RequestParam(value = "categoryId", required = false) Long categoryId,
			@RequestParam(value = "regionId", required = false) Long regionId) {
		purchase.setCreateTime(CoreUtils.nowtime());
		purchase.setUpdateTime(CoreUtils.nowtime());
		purchase.setPublishTime(CoreUtils.nowtime());
		if (this.getCurrentUser() != null) {
			purchaseService.savePurchase(purchase, this.getCurrentUser().getId(), categoryId, regionId);
			return this.ajaxDoneSuccess("创建成功");
		} else {
			return this.ajaxDoneError("请登录！");
		}

	}

	@RequestMapping(value = "/help")
	public String helpCenter(Model model, HttpServletRequest request) {
		return "hfive/trading/help";
	}

	public static class PublishForm {
		private String smonth1;
		private String sday1;
		private String emonth1;
		private String eday1;

		private String smonth2;
		private String sday2;
		private String emonth2;
		private String eday2;

		public String getSmonth1() {
			return smonth1;
		}

		public void setSmonth1(String smonth1) {
			this.smonth1 = smonth1;
		}

		public String getSday1() {
			return sday1;
		}

		public void setSday1(String sday1) {
			this.sday1 = sday1;
		}

		public String getEmonth1() {
			return emonth1;
		}

		public void setEmonth1(String emonth1) {
			this.emonth1 = emonth1;
		}

		public String getEday1() {
			return eday1;
		}

		public void setEday1(String eday1) {
			this.eday1 = eday1;
		}

		public String getSmonth2() {
			return smonth2;
		}

		public void setSmonth2(String smonth2) {
			this.smonth2 = smonth2;
		}

		public String getSday2() {
			return sday2;
		}

		public void setSday2(String sday2) {
			this.sday2 = sday2;
		}

		public String getEmonth2() {
			return emonth2;
		}

		public void setEmonth2(String emonth2) {
			this.emonth2 = emonth2;
		}

		public String getEday2() {
			return eday2;
		}

		public void setEday2(String eday2) {
			this.eday2 = eday2;
		}

		public String getStartMonthDay1() {
			return this.smonth1 + this.sday1;
		}

		public String getStartMonthDay2() {
			return this.smonth2 + this.sday2;
		}

		public String getEndMonthDay1() {
			return this.emonth1 + this.eday1;
		}

		public String getEndMonthDay2() {
			return this.emonth2 + this.eday2;
		}
	}

}
