package com.smilehat.business.web.hfive;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smilehat.business.core.web.BaseController;

public abstract class HfiveBaseController extends BaseController {
	public static final String PATH_BASE = "";

	@RequestMapping(value = { "", "/introduce" })
	public String productCenter(Model model, HttpServletRequest request) {
		return "hfive/introduce";
	}
}
