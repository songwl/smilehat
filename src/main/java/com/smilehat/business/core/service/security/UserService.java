package com.smilehat.business.core.service.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.core.entity.security.Role;
import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.repository.security.RoleDao;
import com.smilehat.business.core.repository.security.UserDao;
import com.smilehat.constants.Constants;
import com.smilehat.modules.service.BaseService;

@Service
@Transactional
public class UserService extends BaseService<User> {
	private static Logger logger = LoggerFactory.getLogger(UserService.class);

	public static final String HASH_ALGORITHM = "MD5";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;

	@Override
	public PagingAndSortingRepository<User, Long> getPagingAndSortingRepositoryDao() {
		return this.userDao;
	}

	@Override
	public JpaSpecificationExecutor<User> getJpaSpecificationExecutorDao() {
		return this.userDao;
	}

	public User findUserByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}

	public User save(User entity, Long[] roleIds) {
		entity.setRoleList(this.findIds(roleIds, roleDao));
		return this.userDao.save(entity);

	}

	public void active(User user, Boolean isActive) {
		Role role = roleDao.findOne(Constants.ACTIVED_USER_ROLE);
		user.getRoleList().remove(role);

		if (isActive) {
			user.getRoleList().add(role);
		}
		userDao.save(user);
	}

}
