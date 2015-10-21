package com.smilehat.business.core.entity.security;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.entity.Customer;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

@Entity
@Table(name = Constants.TABLE_PREFIX + "user")
public class User extends IdEntity {
	private String loginName; //手机号作为登录名
	private String name;
	private String email;
	private String plainPassword;
	private String password;
	private String salt;
	private Date createTime;
	private Date registerDate;
	private Date updateTime;
	private String userType; //Enums.USER_TYPE 中定义
	private Boolean isEnabled = Boolean.TRUE; //默认可用
	private java.lang.Boolean isDeleted = Boolean.FALSE; // 默认未删除
	private java.lang.Boolean isAudit; //是否审核通过
	private java.util.Date auditTime;//审核时间
	private String phone;//联系电话

	private Attach photoAttach;

	private Customer customer;

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

	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "user_attach", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = { @JoinColumn(name = "attach_id") })
	public List<Attach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public java.lang.Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(java.lang.Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public java.lang.Boolean getIsAudit() {
		return isAudit;
	}

	public void setIsAudit(java.lang.Boolean isAudit) {
		this.isAudit = isAudit;
	}

	public java.util.Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(java.util.Date auditTime) {
		this.auditTime = auditTime;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "user")
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}