package com.smilehat.business.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.google.common.collect.Lists;
import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX + "product")
public class Product extends IdEntity {

	private java.lang.String name;//产品名称
	private java.lang.String title;//标题
	private java.lang.String description;//产品特色
	private java.util.Date createTime;//创建时间
	private java.util.Date updateTime;//更新时间
	private java.util.Date publishTime;//发布时间
	private java.lang.String branch;//规格
	private java.lang.String branchInfo;//规格单位
	private java.lang.String priceUnit;//价格单位
	private java.lang.Double price;//价格
	private java.lang.Double price2;//价格
	private java.lang.String quantity;//供应量
	private java.lang.String quantityUnit;//供应量单位
	private java.lang.String regionDetail;//详细地址
	private java.lang.Integer sort;//排序字段
	private java.lang.Boolean isDeleted = Boolean.FALSE; // 默认未删除
	private java.lang.Integer visitCount; //访问次数

	private java.lang.String trademark;//品牌
	private java.lang.String packing;//包装方式
	private java.lang.String depot;//贮藏方式
	private java.lang.String expiratinDate;//保质期

	private java.lang.String startTime;//上市开始时间
	private java.lang.String endTime;//上市结束时间
	private java.lang.String startTime2;//上市开始时间2
	private java.lang.String endTime2;//上市结束时间2
	private java.lang.String startTime3;//上市开始时间3
	private java.lang.String endTime3;//上市结束时间3

	private java.lang.String minOrder;//起订量
	
	private Region region;//区域
	private Category category;//品类
	private User user;

	private List<CertLabel> certLabelList = new ArrayList<>();
	private List<Attach> attachs = Lists.newArrayList(); //产品图片

	@Transient
	private Map<Long, CertLabel> certLabelMap;

	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "product_attach", joinColumns = { @JoinColumn(name = "product_id") }, inverseJoinColumns = { @JoinColumn(name = "attach_id") })
	public List<Attach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	/**
	 * @return
	 */
	@Column(name = "min_order")
	public java.lang.String getMinOrder() {
		return this.minOrder;
	}

	public void setMinOrder(java.lang.String value) {
		this.minOrder = value;
	}
	
	/**
	 * @return
	 */
	@Column(name = "trademark")
	public java.lang.String getTrademark() {
		return this.trademark;
	}

	public void setTrademark(java.lang.String value) {
		this.trademark = value;
	}

	/**
	 * @return
	 */
	@Column(name = "packing")
	public java.lang.String getPacking() {
		return this.packing;
	}

	public void setPacking(java.lang.String value) {
		this.packing = value;
	}

	/**
	 * @return
	 */
	@Column(name = "depot")
	public java.lang.String getDepot() {
		return this.depot;
	}

	public void setDepot(java.lang.String value) {
		this.depot = value;
	}

	/**
	 * @return
	 */
	@Column(name = "expiratin_date")
	public java.lang.String getExpiratinDate() {
		return this.expiratinDate;
	}

	public void setExpiratinDate(java.lang.String value) {
		this.expiratinDate = value;
	}

	/**
	 * @return
	 */
	@Column(name = "name")
	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String value) {
		this.name = value;
	}

	/**
	 * @return
	 */
	public java.lang.Integer getSort() {
		return sort;
	}

	public void setSort(java.lang.Integer sort) {
		this.sort = sort;
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

	/**
	 * @return
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "region_id")
	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
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

	public void setDescription(java.lang.String value) {
		this.description = value;
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
	@Column(name = "start_time")
	public java.lang.String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(java.lang.String value) {
		this.startTime = value;
	}

	/**
	 * @return
	 */
	@Column(name = "end_time")
	public java.lang.String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(java.lang.String value) {
		this.endTime = value;
	}

	/**
	 * @return
	 */
	@Column(name = "start_time2")
	public java.lang.String getStartTime2() {
		return this.startTime2;
	}

	public void setStartTime2(java.lang.String value) {
		this.startTime2 = value;
	}

	/**
	 * @return
	 */
	@Column(name = "end_time2")
	public java.lang.String getEndTime2() {
		return this.endTime2;
	}

	public void setEndTime2(java.lang.String value) {
		this.endTime2 = value;
	}

	/**
	 * @return
	 */
	@Column(name = "start_time3")
	public java.lang.String getStartTime3() {
		return this.startTime3;
	}

	public void setStartTime3(java.lang.String value) {
		this.startTime3 = value;
	}

	/**
	 * @return
	 */
	@Column(name = "end_time3")
	public java.lang.String getEndTime3() {
		return this.endTime3;
	}

	public void setEndTime3(java.lang.String value) {
		this.endTime3 = value;
	}

	
	/**
	 * @return
	 */
	@Column(name = "branch")
	public java.lang.String getBranch() {
		return this.branch;
	}

	public void setBranch(java.lang.String value) {
		this.branch = value;
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
	@Column(name = "price2")
	public java.lang.Double getPrice2() {
		return this.price2;
	}

	public void setPrice2(java.lang.Double value) {
		this.price2 = value;
	}

	/**
	 * @return
	 */
	@Column(name = "quantity")
	public java.lang.String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(java.lang.String value) {
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
	@Column(name = "region_detail")
	public java.lang.String getRegionDetail() {
		return this.regionDetail;
	}

	public void setRegionDetail(java.lang.String value) {
		this.regionDetail = value;
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

	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "product_cert_label", joinColumns = { @JoinColumn(name = "product_id") }, inverseJoinColumns = { @JoinColumn(name = "cert_label_id") })
	public List<CertLabel> getCertLabelList() {
		return certLabelList;
	}

	public void setCertLabelList(List<CertLabel> certLabelList) {
		this.certLabelList = certLabelList;
	}

	@Transient
	public Map<Long, CertLabel> getCertLabelMap() {
		if (certLabelMap == null) {
			certLabelMap = new HashMap<>();
			for (CertLabel certLabel : certLabelList) {
				certLabelMap.put(certLabel.getId(), certLabel);
			}
		}
		return certLabelMap;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
