package com.smilehat.business.web.sys.purchase;

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
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.service.PurchaseService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

import java.util.*;
import com.smilehat.modules.entity.IdEntity;

 
/**
 * 
 * @author yang
 *
 */
@Controller
@RequestMapping(value =  Constants.SPT+SysPurchaseController.PATH)
public class SysPurchaseController extends BaseController {
	 
	@Autowired
	private PurchaseService purchaseService;
	public static final String PATH = "sys/purchase";
	public static final String PATH_LIST = PATH +Constants.SPT+ "list";
	public static final String PATH_EDIT = PATH + Constants.SPT+"edit";
	public static final String PATH_VIEW = PATH + Constants.SPT+"view";
	public static final String PATH_SEARCH = PATH + Constants.SPT+"search";
	
	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();
	 

		Page<Purchase> page = purchaseService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
	
		return PATH_LIST;
	}
	
	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request){
		Map<String, Object> searchParams = this.getSearchRequest();
		List<Purchase> list=purchaseService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);
		
	}
	
	

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Purchase());
		model.addAttribute("action", BaseController.CREATE);
		return PATH_EDIT;
	}

	@RequestMapping(value =  BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Purchase purchase) {
		purchaseService.save(purchase);		 
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value =  BaseController.UPDATE+"/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", purchaseService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return PATH_EDIT;
	}
	
	
	@RequestMapping(value =  BaseController.VIEW+"/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", purchaseService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Purchase purchase) {
		purchaseService.save(purchase);		
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE+"/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		purchaseService.deleteById(id);		 
		return this.ajaxDoneSuccess("删除成功");
	}
	
	@RequestMapping(value = BaseController.DELETE,method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		purchaseService.deleteByIds(ids);		 
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
	public Purchase getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return purchaseService.getObjectById(id);
		}
		return null;
	}
	

}
