package com.smilehat.business.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

 

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX +"government")
public class Government extends IdEntity {

	 
     private java.lang.String name;//政府名称
     private java.lang.String introduction;//政府简介
     private java.lang.String description;//政府详细说明
     private java.lang.String website;//官网地址
     //private java.lang.Long regionId;
     private java.lang.String regionDetail;//详细地址
     private java.lang.String contact;//联系方式
     private java.lang.Long attachId;//附件图片id
     private java.util.Date createTime;//创建时间
     private  java.lang.Integer sort;//排序字段
	 
     private Region region;//区域
     
     private List<Attach> attachList;

     private List<GovernmentCatalog> catalogList;
     
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
 	@ManyToOne
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
	@Column(name = "name" )
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "introduction" )
	public java.lang.String getIntroduction() {
		return this.introduction;
	}
	
	public void setIntroduction(java.lang.String value) {
		this.introduction = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "description" )
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String value) {
		this.description = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "website" )
	public java.lang.String getWebsite() {
		return this.website;
	}
	
	public void setWebsite(java.lang.String value) {
		this.website = value;
	}
	
	/**
	 * @return
	 */
	@Column(name = "region_detail" )
	public java.lang.String getRegionDetail() {
		return this.regionDetail;
	}
	
	public void setRegionDetail(java.lang.String value) {
		this.regionDetail = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "contact" )
	public java.lang.String getContact() {
		return this.contact;
	}
	
	public void setContact(java.lang.String value) {
		this.contact = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "attach_id" )
	public java.lang.Long getAttachId() {
		return this.attachId;
	}
	
	public void setAttachId(java.lang.Long value) {
		this.attachId = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "create_time" )
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "government_attach", joinColumns = { @JoinColumn(name = "government_id") }, inverseJoinColumns = { @JoinColumn(name = "attach_id") })
	public List<Attach> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<Attach> attachList) {
		this.attachList = attachList;
	}

	@OneToMany(mappedBy="government")
	public List<GovernmentCatalog> getCatalogList() {
		return catalogList;
	}

	public void setCatalogList(List<GovernmentCatalog> catalogList) {
		this.catalogList = catalogList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

