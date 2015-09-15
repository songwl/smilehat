package com.smilehat.business.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX + "purchase")
public class Purchase extends IdEntity {

	private java.lang.String title;//标题
	private java.lang.String description;//描述
	private java.lang.Double quantity;//采购量
	private java.lang.String quantityUnit;//采购量单位
	private java.lang.Double price;//采购价格
	private java.lang.String priceUnit;//采购价格单位
	private java.util.Date createTime;//创建时间
	private java.util.Date updateTime;//更新时间
	private java.util.Date publishTime;//发布时间
	private java.lang.Integer sort;//排序字段
	private java.lang.Boolean isDeleted = Boolean.FALSE; // 默认未删除
	private java.lang.Integer visitCount; //访问次数
	private java.lang.String branchInfo;//规格

	private Category category;//品类
	private User user;

	public java.lang.Integer getSort() {
		return sort;
	}

	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
	}

	/**
	 * @return
	 */
	@Column(name = "branch_info")
	public java.lang.String getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(java.lang.String value) {
		this.branchInfo = value;
	}

	
	/**
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name = "category_id")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	/**
	 * @return
	 */
	@Column(name = "title")
	public java.lang.String getTitle() {
		return this.title;
	}

	public void setTitle(java.lang.String value) {
		this.title = value;
	}

	/**
	 * @return
	 */
	@Column(name = "description")
	public java.lang.String getDescription() {
		return this.description;
	}

	public void setDescription(java.lang.String value) {
		this.description = value;
	}

	/**
	 * @return
	 */
	@Column(name = "quantity")
	public java.lang.Double getQuantity() {
		return this.quantity;
	}

	public void setQuantity(java.lang.Double value) {
		this.quantity = value;
	}

	/**
	 * @return
	 */
	@Column(name = "quantity_unit")
	public java.lang.String getQuantityUnit() {
		return this.quantityUnit;
	}

	public void setQuantityUnit(java.lang.String value) {
		this.quantityUnit = value;
	}

	/**
	 * @return
	 */
	@Column(name = "price")
	public java.lang.Double getPrice() {
		return this.price;
	}

	public void setPrice(java.lang.Double value) {
		this.price = value;
	}

	/**
	 * @return
	 */
	@Column(name = "price_unit")
	public java.lang.String getPriceUnit() {
		return this.priceUnit;
	}

	public void setPriceUnit(java.lang.String value) {
		this.priceUnit = value;
	}

	/**
	 * @return
	 */
	@Column(name = "create_time")
	public java.util.Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}

	/**
	 * @return
	 */
	@Column(name = "update_time")
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}

	/**
	 * @return
	 */
	@Column(name = "publish_time")
	public java.util.Date getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(java.util.Date value) {
		this.publishTime = value;
	}

	/**
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "is_deleted")
	public java.lang.Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(java.lang.Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name = "visit_count")
	public java.lang.Integer getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(java.lang.Integer visitCount) {
		this.visitCount = visitCount;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
