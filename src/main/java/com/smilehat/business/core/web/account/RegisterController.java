package com.smilehat.business.core.web.account;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.core.service.security.AccountService;
import com.smilehat.business.core.service.sys.upload.AttachService;
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

	@Autowired
	private AttachService attachService;

	@RequestMapping(method = RequestMethod.GET)
	public String registerForm(Model model, @RequestParam String userType) {
		model.addAttribute("userType", userType);
		return "/account/hfive/register";
	}

	@RequestMapping(value = "guide", method = RequestMethod.GET)
	public String registerGuide() {
		return "/account/hfive/registerGuide";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String register(@Valid User user, @RequestParam(required = false) Long[] identityAttachIds, @RequestParam(required = false) Long[] userAttachIds, RedirectAttributes redirectAttributes) {
		if (identityAttachIds != null) {
			List<Attach> list = new ArrayList<Attach>();
			for (Long attachId : identityAttachIds) {
				list.add(attachService.getObjectById(attachId));
			}
			user.setIdentityAttachs(list);
		}
		if (userAttachIds != null) {
			List<Attach> list = new ArrayList<Attach>();
			for (Long attachId : userAttachIds) {
				list.add(attachService.getObjectById(attachId));
			}
			user.setAttachs(list);
		}
		user.setRegisterDate(new Date());
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
