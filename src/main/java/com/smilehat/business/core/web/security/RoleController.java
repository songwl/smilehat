package com.smilehat.business.core.web.security;

import java.util.Map;

import javax.servlet.ServletRequest;
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

import com.smilehat.business.core.entity.security.Role;
import com.smilehat.business.core.service.security.RoleService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.web.sys.SysBaseController;
import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + RoleController.PATH)
public class RoleController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/role";
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "")
	public String list(Model model, ServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("name", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<Role> page = roleService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return "sys/role/list";
	}

	@RequestMapping(value = "select")
	public String select(Model model, ServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("name", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<Role> page = roleService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return "sys/role/select";
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vm", roleService.getObjectById(id));
		return "sys/role/view";
	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new Role());
		model.addAttribute("action", BaseController.CREATE);
		return "sys/role/edit";
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid Role role, @RequestParam(value = "authority.id", required = false) Long[] ids) {
		roleService.save(role, ids);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vm", roleService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return "sys/role/edit";
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") Role role,
			@RequestParam(value = "authority.id", required = false) Long[] ids) {
		roleService.save(role, ids);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) {
		roleService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam Long[] ids) {
		roleService.deleteByIds(ids);
		return this.ajaxDoneSuccess("删除成功");
	}

	/**
	 *  高级查询界面
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	/*@RequestMapping(value = "search")
	public String search(ServletRequest request) {
		return "sys/role/search";
	}*/

	@ModelAttribute("preloadModel")
	public Role getModel(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return roleService.getObjectById(id);
		}
		return null;
	}
}
