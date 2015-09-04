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

import com.smilehat.business.core.entity.sys.SysLog;
import com.smilehat.business.core.service.sys.SysLogService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.business.web.sys.SysBaseController;
import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + SysLogController.PATH)
public class SysLogController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE + "/syslog";
	//视图地址映射
	public static final String V_PATH_LIST = PATH + Constants.SPT + "list";
	@Autowired
	private SysLogService sysLogService;

	@RequestMapping(value = "")
	public String list(Model model, ServletRequest request) {
		PageRequest pageRequest = this.getPageRequest("createTime", "desc");
		Map<String, Object> searchParams = this.getSearchRequest();
		Page<SysLog> page = sysLogService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
		return V_PATH_LIST;
	}

	@RequestMapping(value = BaseController.DELETE + "/{id}")
	public ModelAndView delete(@PathVariable("id") Long id) {
		sysLogService.deleteById(id);
		return this.ajaxDoneSuccess("删除成功");
	}

	@RequestMapping(value = BaseController.DELETE, method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam Long[] ids) {
		sysLogService.deleteByIds(ids);
		return this.ajaxDoneSuccess("删除成功");
	}
}
