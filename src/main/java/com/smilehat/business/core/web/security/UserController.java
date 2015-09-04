package com.smilehat.business.core.web.security;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.web.sys.SysBaseController;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;
import com.smilehat.util.MD5Util;

/**
 * 用户管理的Controller 
 */
@Controller
@RequestMapping(value = Constants.SPT + UserController.PATH)
public class UserController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/user";
	//视图地址映射
	public static final String V_PATH_LIST = PATH + Constants.SPT + "list";
	public static final String V_PATH_EDIT = PATH + Constants.SPT + "edit";
	public static final String V_PATH_VIEW = PATH + Constants.SPT + "view";
	public static final String V_PATH_SEARCH = PATH + Constants.SPT + "search";
	public static final String V_PATH_SELECT = PATH + Constants.SPT + "select";

	@Autowired
	private UserService userService;
	@Autowired
	private AttachService attachService;

	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest("id", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<User> page = userService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);

		return V_PATH_LIST;
	}

	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request) {
		Map<String, Object> searchParams = this.getSearchRequest();
		List<User> list = userService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());

		//		StringUtils.equals(request.getParameter("type"), [REPORT_FORMAT_PDF,])

		return this.reportView(V_PATH_LIST, list, request.getParameter(REQUEST_REPORT_FORMAT_TYPE), "用户表");

	}

	@RequestMapping(value = "select")
	public String select(Model model, ServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("name", "asc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<User> page = userService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return V_PATH_SELECT;
	}

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new User());
		model.addAttribute("action", BaseController.CREATE);
		return V_PATH_EDIT;
	}

	@RequestMapping(value = BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid User user, @RequestParam(value = "photoAttachId", required = false) Long photoAttachId, @RequestParam("role.id") Long[] roleIds) {
		user.setPassword(user.getPlainPassword());
		user.setCreateTime(CoreUtils.nowtime());
		userService.save(user, roleIds);
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value = BaseController.UPDATE + "/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vm", userService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return V_PATH_EDIT;
	}

	@RequestMapping(value = BaseController.VIEW + "/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("vm", userService.getObjectById(id));
		return V_PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") User user, @RequestParam(value = "photoAttachId", required = false) Long photoAttachId, @RequestParam("role.id") Long[] roleIds) {
		user.setPassword(MD5Util.MD5(user.getPassword()));
		user.setUpdateTime(CoreUtils.nowtime());
		user.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		userService.save(user, roleIds);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = "reset/{id}", method = RequestMethod.GET)
	public ModelAndView resetFrom(@PathVariable("id") Long id) {
		//user.setPassword(MD5Util.MD5(user.getPlainPassword()));
		User user = userService.getObjectById(id);
		if (user == null) {
			return this.ajaxDoneError("用户不存在");
		}
		ModelAndView mav = new ModelAndView("sys/user/reset");
		mav.addObject("vm", user);
		return mav;
	}

	@RequestMapping(value = "reset", method = RequestMethod.POST)
	public ModelAndView reset(@RequestParam("id") Long id, @RequestParam("plainPassword") String plainPassword) {
		User user = userService.getObjectById(id);

		if (user == null) {
			return this.ajaxDoneError("用户不存在");
		}
		user.setPassword(MD5Util.MD5(plainPassword));
		userService.save(user);
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) {
		userService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam Long[] ids) {
		userService.deleteByIds(ids);
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
		return V_PATH_SEARCH;
	}

	@RequestMapping(value = "checkloginname")
	@ResponseBody
	public Boolean checkLoginName(@RequestParam(value = "oldLoginName", required = false) String oldLoginName, @RequestParam(value = "loginName") String loginName) {
		return userService.isPropertyUnique("loginName", loginName, oldLoginName);
	}

	@ModelAttribute("preloadModel")
	public User getModel(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return userService.getObjectById(id);
		}
		return null;
	}

}
