package com.smilehat.business.core.service.security;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.utils.DateProvider;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.repository.security.UserDao;
import com.smilehat.business.core.service.security.ShiroDbRealm.ShiroUser;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.repository.CustomerDao;
import com.smilehat.constants.Enums;
import com.smilehat.modules.service.ServiceException;
import com.smilehat.util.MD5Util;

/**
 * 用户管理类.
 * 
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional(readOnly = true)
public class AccountService {

	public static final String HASH_ALGORITHM = "MD5";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	private UserDao userDao;

	private CustomerDao customerDao;

	private UserService userService;

	private DateProvider dateProvider = DateProvider.DEFAULT;

	public List<User> getAllUser() {
		return (List<User>) userDao.findAll();
	}

	public User getUser(Long id) {
		return userDao.findOne(id);
	}

	public User findUserByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}

	@Transactional(readOnly = false)
	public void registerUser(User user) {
		entryptPassword(user);
		user.setCreateTime(dateProvider.getDate());

		Long[] roleIds = new Long[1];
		if (Enums.USER_TYPE.PERSON.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 3L;
		} else if (Enums.USER_TYPE.DEALER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 14L;
		} else if (Enums.USER_TYPE.FARMER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 15L;
		}
		userService.save(user, roleIds);

		Customer customer = user.getCustomer();
		customer.setUser(user);
		customerDao.save(customer);
	}

	@Transactional(readOnly = false)
	public void updateUser(User user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		userDao.save(user);
	}

	@Transactional(readOnly = false)
	public void deleteUser(Long id) {
		if (isSupervisor(id)) {
			logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
			throw new ServiceException("不能删除超级管理员用户");
		}
		userDao.delete(id);

	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id) {
		return id == 1;
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.loginName;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		//sha1加密
		//		byte[] salt = Digests.generateSalt(SALT_SIZE);
		//		user.setSalt(Encodes.encodeHex(salt));
		//		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);

		//md5加密 
		user.setPassword(MD5Util.MD5(user.getPlainPassword()));
	}

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setDateProvider(DateProvider dateProvider) {
		this.dateProvider = dateProvider;
	}

	@Autowired
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
