package com.smilehat.business.core.web.account;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smilehat.business.core.web.BaseController;
import com.smilehat.constants.Constants;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，

 * 真正登录的POST请求由Filter完成,
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = Constants.SPT + LogoutController.PATH)
public class LogoutController extends BaseController {
	//控制层 URL地址映射
	public static final String PATH = "/logout";
	//视图地址映射
	public static final String V_PATH_LIST = "/account/login";

	@RequestMapping(value = "manage")
	public String logout() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return V_PATH_LIST;
	}

}
