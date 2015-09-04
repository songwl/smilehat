package com.smilehat.business.core.entity.sys;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

@Entity
@Table(name = Constants.TABLE_PREFIX+"login_log")
public class LoginLog extends IdEntity{
	private Date createTime;	
	private String userIp;
	private String logContent;
	private String userName;	
	private User user;
	
	@NotNull
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	@NotBlank
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}	

	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
