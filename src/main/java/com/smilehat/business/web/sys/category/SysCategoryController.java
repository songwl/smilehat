package com.smilehat.business.web.sys.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Maps;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Category;
import com.smilehat.business.service.CategoryService;
import com.smilehat.business.service.ProductService;
import com.smilehat.business.service.PurchaseService;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

/**
 * 
 * @author yang
 *
 */
@Controller
@RequestMapping(value = Constants.SPT + SysCategoryController.PATH)
public class SysCategoryController extends BaseController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private PurchaseService purchaseService;

	public static final String PATH = "sys/category";
	public static final String PATH_LIST = PATH + Constants.SPT + "list";
	public static final String PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String PATH_SEARCH = PATH + Constants.SPT + "search";
	public static final String PATH_SELECT = PATH + "/select";

	@RequestMapping(value = "")
	public String list(Model model, @RequestParam(required = false, value = "id") Long id) {
		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("ISNULL_parent", null);
		List<Category> categoryList = categoryService.findAll(searchParams, "sort", "asc");
		model.addAttribute("categorylist", categoryList);
		//当前选中的栏目 可以是null 
		model.addAttribute("vm", this.getModel(id));

		return PATH_LIST;
	}

	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request) {
		Map<String, Object> searchParams = this.getSearchRequest();
		List<Category> list = categoryService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);

	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Category());
		model.addAttribute("action", BaseController.CREATE);
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Category category, @RequestParam(value = "categoryTree.id") Long parentId) {
		category.setCreateTime(CoreUtils.nowtime());
		categoryService.save(category, parentId);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", categoryService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", categoryService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Category category, @RequestParam(value = "categoryTree.id") Long parentId) {
		categoryService.save(category, parentId);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		Category category = categoryService.getObjectById(id);
		if (category.getChildren() != null && !category.getChildren().isEmpty()) {
			return this.ajaxDoneSuccess("改品类包含下级品类，不建议直接删除！");
		}

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("EQ_category.id", id);
		params.put("EQ_isDeleted", false);
		long c1 = productService.count(params);
		long c2 = purchaseService.count(params);
		if (c1 > 0 || c2 > 0) {
			return this.ajaxDoneSuccess("已有产品或采购选择该品类，不可删除！");
		} else {
			categoryService.deleteById(id);
			return this.ajaxDoneSuccess("删除成功");
		}
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		categoryService.deleteByIds(ids);
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
	public Category getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return categoryService.getObjectById(id);
		}
		return null;
	}

	/**
	 * 栏目树
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "select")
	public String select(Model model, HttpServletRequest request) {
		Map<String, Object> searchParams = Maps.newHashMap();
		searchParams.put("ISNULL_parent", null);
		List<Category> category = categoryService.findAll(searchParams, "sort", "asc");
		model.addAttribute("categorylist", category);
		return PATH_SELECT;
	}

	@RequestMapping(value = "checkparent")
	@ResponseBody
	public Boolean checkParent(@RequestParam(value = "id") Long id, @RequestParam(value = "catalogTree.id", required = false) Long pid) {
		//当前的设置的上级栏目，不能是本栏目的子栏目(会递归出错)
		if (id == null || pid == null) {
			return true;
		}
		if (id.equals(pid)) {
			return false;
		}
		return !categoryService.isParent(pid, id);
	}

}
