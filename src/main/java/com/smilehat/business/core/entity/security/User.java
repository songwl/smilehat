package com.smilehat.business.core.entity.security;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

@Entity
@Table(name = Constants.TABLE_PREFIX + "user")
public class User extends IdEntity {
	private String loginName;
	private String name;
	private String plainPassword;
	private String password;
	private String salt;
	private Date createTime;
	private Long userType = 1L; //1.前台会员 2.后台员工
	private Boolean isEnabled = Boolean.TRUE;
	private Date updateTime;
	private Attach photoAttach;

	private List<Attach> attachs = Lists.newArrayList();
	private List<Role> roleList = Lists.newArrayList();

	@NotBlank
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// 不持久化到数据库，也不显示在Restful接口的属性.
	@Transient
	@JsonIgnore
	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "user_role", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = { @JoinColumn(name = "role_id") })
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@OneToMany(mappedBy = "user")
	public List<Attach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	/**
	 * 
	 * @return 1.前台会员 2.后台员工
	 */
	public Long getUserType() {
		return userType;
	}

	public void setUserType(Long userType) {
		this.userType = userType;
	}

	public Boolean getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@ManyToOne
	@JoinColumn(name = "photo_attach_id")
	public Attach getPhotoAttach() {
		return photoAttach;
	}

	public void setPhotoAttach(Attach photoAttach) {
		this.photoAttach = photoAttach;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}