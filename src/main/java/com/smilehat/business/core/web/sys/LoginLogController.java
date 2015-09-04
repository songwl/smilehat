package com.smilehat.business.core.web.sys;

import java.util.Map;

import javax.servlet.ServletRequest;

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

import com.smilehat.business.core.entity.sys.LoginLog;
import com.smilehat.business.core.service.sys.LoginLogService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.web.sys.SysBaseController;
import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + LoginLogController.PATH)
public class LoginLogController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/loginlog";
	//视图地址映射
	public static final String V_PATH_LIST = PATH + Constants.SPT + "list";
	@Autowired
	private LoginLogService loginLogService;

	@RequestMapping(value = "")
	public String list(Model model, ServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("createTime", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<LoginLog> page = loginLogService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return V_PATH_LIST;
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) {
		loginLogService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam Long[] ids) {
		loginLogService.deleteByIds(ids);
		return this.ajaxDoneSuccess("删除成功");
	}
}
