package com.smilehat.business.core.web.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.captchastore.CaptchaStore;
import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.constants.Constants;
import com.smilehat.constants.Enums;
import com.smilehat.util.CoreUtils;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，

 * 真正登录的POST请求由Filter完成,
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = Constants.SPT + LoginController.PATH)
public class LoginController extends BaseController {

	public static final String PATH = "/login";

	public static final String V_PATH_LOGIN = "/account/login";
	public static final String V_PATH_AJAX_LOGIN = "/account/unauthorized";
	public static final String V_PATH_AJAX_DIALOG = "/account/logindialog";

	@Autowired
	private CaptchaStore captchaStore;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		String header = request.getHeader("user-agent");
		if (header.indexOf("Mobile") == -1) {
			//ajax请求返回无授权json
			if (CoreUtils.isAjax(request)) {
				return V_PATH_AJAX_LOGIN;
			}
			return V_PATH_LOGIN;
		} else {
			return "/account/hfive/login";
		}

	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String dologin(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String username, @RequestParam String password,
			@RequestParam(required = false, defaultValue = "false") boolean rememberMe, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String host = request.getRemoteHost();
		AuthenticationToken token = new UsernamePasswordToken(username, password, rememberMe, host);
		boolean flag = executeLogin(token);
		if (!flag) {
			//ajax请求返回无授权json
			if (CoreUtils.isAjax(request)) {
				return V_PATH_AJAX_LOGIN;
			}
			model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
			model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, this.getMessage("LoginController.dologin.error"));
			return V_PATH_LOGIN;
		}
		User user = this.getCurrentUser();
		if(Enums.USER_TYPE.ADMIN.name().equalsIgnoreCase(user.getUserType())){
			WebUtils.redirectToSavedRequest(request, response, "/sys/index");
		}else{
			WebUtils.redirectToSavedRequest(request, response, "/trading");
		}
		//return "redirect:/index";
		return null;
	}

	@RequestMapping(value = "dialog", method = RequestMethod.GET)
	public String dialog() {
		return V_PATH_AJAX_DIALOG;
	}

	@RequestMapping(value = "ajax", method = RequestMethod.POST)
	public ModelAndView ajaxlogin(@RequestParam String username, @RequestParam String password, @RequestParam(required = false, defaultValue = "false") boolean rememberMe, HttpServletRequest request,
			HttpServletResponse response) {
		String host = request.getRemoteHost();
		AuthenticationToken token = new UsernamePasswordToken(username, password, rememberMe, host);
		boolean flag = executeLogin(token);
		if (flag) {
			return this.ajaxDoneSuccess("登录成功");
		}
		return this.ajaxDoneError("登录失败");

	}

	@RequestMapping(value = "unauthorized", method = RequestMethod.GET)
	public String unauthorized(HttpServletRequest request) {
		if (CoreUtils.isAjax(request)) {
			return V_PATH_AJAX_LOGIN;
		}
		return V_PATH_LOGIN;

	}

	@RequestMapping(value = "checkcaptcha")
	@ResponseBody
	public Boolean checkValidateCaptcha(HttpServletRequest request) {
		try {
			String captchaID = request.getSession(true).getId();
			String challengeResponse = request.getParameter("vcaptcha");
			return captchaStore.getCaptcha(captchaID).validateResponse(challengeResponse);
		} catch (CaptchaServiceException e) {
			return false;
		}
	}

	private boolean executeLogin(AuthenticationToken token) {
		try {
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);
			return true;
		} catch (AuthenticationException e) {
			//登陆失败
			return false;
		}
	}

}
