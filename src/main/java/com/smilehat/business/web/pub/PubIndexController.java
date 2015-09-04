package com.smilehat.business.web.pub;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smilehat.constants.Constants;

@Controller
@RequestMapping(value = Constants.SPT + PubIndexController.PATH)
public class PubIndexController extends PubBaseController {

	// 控制层 URL地址映射
	public static final String PATH = PATH_BASE;

	// 视图地址映射
	public static final String V_PATH_INDEX = V_PATH_BASE + Constants.SPT + "index";

	@RequestMapping(value = "index")
	public String index(Model model) {
		return V_PATH_INDEX;
	}

}