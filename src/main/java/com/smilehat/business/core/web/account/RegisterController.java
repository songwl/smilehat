package com.smilehat.business.core.web.account;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.service.security.AccountService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.constants.Constants;

/**
 * 用户注册的Controller.
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = Constants.SPT + RegisterController.PATH)
public class RegisterController extends BaseController {
	//控制层 URL地址映射
	public static final String PATH = "/register";

	public static final String V_PATH_REGISTER = "/account/register";

	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm() {
		return "/account/hfive/register";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(@Valid User user, RedirectAttributes redirectAttributes) {
		accountService.registerUser(user);
		redirectAttributes.addFlashAttribute("username", user.getLoginName());
		return "redirect:/login";
	}

	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("loginName") String loginName) {
		if (accountService.findUserByLoginName(loginName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
