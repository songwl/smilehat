package com.smilehat.business.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + SysIndexController.PATH)
public class SysIndexController extends SysBaseController {
	//控制层 URL地址映射
	public static final String PATH = PATH_BASE;

	//视图地址映射
	public static final String V_PATH_INDEX = PATH + Constants.SPT + "index";

	@RequestMapping(value = "/index")
	public String home(Model model) {
		return V_PATH_INDEX;
	}

}