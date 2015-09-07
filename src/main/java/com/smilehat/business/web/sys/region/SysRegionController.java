package com.smilehat.business.web.sys.region;

import java.util.List;
import java.util.Map;

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
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.Region;
import com.smilehat.business.service.RegionService;
import com.smilehat.constants.Constants;

/**
 * 
 * @author yang
 *
 */
@Controller
@RequestMapping(value = Constants.SPT + SysRegionController.PATH)
public class SysRegionController extends BaseController {

	@Autowired
	private RegionService regionService;
	public static final String PATH = "sys/region";
	public static final String PATH_LIST = PATH + Constants.SPT + "list";
	public static final String PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String PATH_SEARCH = PATH + Constants.SPT + "search";
	public static final String PATH_SELECT = PATH + "/select";

	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();

		Page<Region> page = regionService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return PATH_LIST;
	}

	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request) {
		Map<String, Object> searchParams = this.getSearchRequest();
		List<Region> list = regionService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);

	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Region());
		model.addAttribute("action", BaseController.CREATE);
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Region region) {
		regionService.save(region);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", regionService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return PATH_EDIT;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", regionService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Region region) {
		regionService.save(region);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		regionService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		regionService.deleteByIds(ids);
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
	public Region getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return regionService.getObjectById(id);
		}
		return null;
	}

	@RequestMapping(value = "selectJson")
	@ResponseBody
	public Object selectJson(@RequestParam(defaultValue = "1") Long pid) {
		Map<String, Object> filterParams = Maps.newHashMap();
		filterParams.put("EQ_parent.id", pid);
		List<Region> regionList = regionService.findAll(filterParams, "regionLevel,regionSort", "asc,asc");

		JSONArray jsonArray = new JSONArray();
		if (!CollectionUtils.isEmpty(regionList)) {
			for (Region region : regionList) {
				JSONArray item = new JSONArray();
				item.add(region.getId());
				item.add(region.getRegionName());
				jsonArray.add(item);
			}
		}
		return jsonArray;
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
		List<Region> region = regionService.findAll(searchParams, "regionSort", "asc");
		model.addAttribute("regionlist", region);
		return PATH_SELECT;
	}
	
	@RequestMapping(value = "checkparent")
	@ResponseBody
	public Boolean checkParent(@RequestParam(value = "id") Long id,
			@RequestParam(value = "regionTree.id", required = false) Long pid) {
		//当前的设置的上级栏目，不能是本栏目的子栏目(会递归出错)
		if (id == null || pid == null) {
			return true;
		}
		if (id.equals(pid)) {
			return false;
		}
		return !regionService.isParent(pid, id);
	}
}
