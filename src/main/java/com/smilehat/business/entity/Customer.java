package com.smilehat.business.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

/**
 * 商户信息表
 * create by song on 2015/9/5
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX + "customer")
public class Customer extends IdEntity {

	private String address; //详细地址
	private String signature; //签名
	private String description; //详细说明
	private String website; //官网网址
	
	private String remarks; //备注
	
	private Boolean isDeleted = Boolean.FALSE; // 默认未删除
	
	private Boolean isArea = Boolean.FALSE; // 默认不是专区
	
	private Region region; //所属地区

	private User user;//用户

	@Column(name = "remarks")
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "signature")
	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "website")
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "is_deleted")
	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	@Column(name = "is_area")
	public Boolean getIsArea() {
		return isArea;
	}

	public void setIsArea(Boolean isArea) {
		this.isArea = isArea;
	}

	@ManyToOne
	@JoinColumn(name = "region_id")
	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	@OneToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
