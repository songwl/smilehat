package com.smilehat.business.core.web.sys;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.shiro.util.CollectionUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.google.common.collect.Maps;
import com.smilehat.business.core.entity.sys.Dict;
import com.smilehat.business.core.service.sys.DictService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Region;
import com.smilehat.business.web.sys.SysBaseController;
import com.smilehat.constants.Constants;

/**
 * 数据字典Controller 
 */
@Controller
@RequestMapping(value = Constants.SPT + DictController.PATH)
public class DictController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/dict";
	@Autowired
	private DictService dictService;
	//视图地址映射
	public static final String V_PATH_LIST = PATH + Constants.SPT + "list";
	public static final String V_PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String V_PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String V_PATH_SEARCH = PATH + Constants.SPT + "search";
	public static final String V_PATH_TYPELIST = PATH + Constants.SPT + "typelist";

	@RequestMapping(value = "")
	public String list(Model model) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<Dict> page = dictService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return V_PATH_LIST;
	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Dict());
		model.addAttribute("action", BaseController.CREATE);
		return V_PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Dict dict) {
		dictService.save(dict);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vm", dictService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return V_PATH_EDIT;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Dict dict) {
		dictService.save(dict);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) {
		dictService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam Long[] ids) {
		dictService.deleteByIds(ids);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = "/typelist")
	public String typelist(Model model) {
		List<String> dictlist = dictService.findAllType();
		model.addAttribute("typelist", dictlist);
		return V_PATH_TYPELIST;
	}

	@RequestMapping(value = "/typelisttest")
	@ResponseBody
	public Object typelisttest(Model model) {
		List<String> dictlist = dictService.findAllType();
		return dictlist;
	}

	@RequestMapping(value = "typealltest")
	@ResponseBody
	public Object typealltest(Model model, HttpServletRequest request) {
		Map<String, Object> searchParams = Maps.newHashMap();
		//searchParams.put("EQ_type", "工作年限");
		List<Dict> dictlist = dictService.findAll(searchParams, "", "");
		System.out.println("\n============" + new DictController() + "\n");
		return dictlist;
	}

	/**
	 *  高级查询界面
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "search")
	public String search(ServletRequest request) {
		return V_PATH_SEARCH;
	}

	@ModelAttribute("preloadModel")
	public Dict getModel(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return dictService.getObjectById(id);
		}
		return null;
	}
	
	@RequestMapping(value = "selectDictByType")
	@ResponseBody
	public Object selectDictByType(@RequestParam(required = true) String dictType) {
		Map<String, Object> filterParams = Maps.newHashMap();
		filterParams.put("EQ_type", dictType);
		List<Dict> dictList = dictService.findAll(filterParams, this.getSortOrderBy(), this.getSortOrderDesc());

		JSONArray jsonArray = new JSONArray();
		if (!CollectionUtils.isEmpty(dictList)) {
			for (Dict dict : dictList) {
				JSONArray item = new JSONArray();
				item.add(dict.getId());
				item.add(dict.getName());
				item.add(dict.getCode());
				jsonArray.add(item);
			}
		}
		return jsonArray;
	}

}
