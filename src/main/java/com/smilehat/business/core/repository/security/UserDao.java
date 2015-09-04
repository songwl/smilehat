package com.smilehat.business.core.repository.security;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.modules.repository.BaseDao;

public interface UserDao extends BaseDao<User> {
	User findByLoginName(String loginName);
}
