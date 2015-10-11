package com.smilehat.business.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

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
@Table(name = Constants.TABLE_PREFIX +"governmentCatalog")
public class GovernmentCatalog extends IdEntity {

	 
     //private java.lang.Long governmentId;
     private java.lang.String catalogName;//子栏目名称
     private java.lang.String description;//描述
     private java.lang.Long attachId;//附件图片id
     private java.util.Date createTime;//创建时间
     private  java.lang.Integer sort;//排序字段
	 
     private Government government;//父级政府
	
     private List<Attach> attachList;
     
     private List<User> farmList;
     
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
 	@JoinColumn(name = "government_id")
     public Government getGovernment() {
 		return government;
 	}

 	public void setGovernment(Government government) {
 		this.government = government;
 	}
	
	
	/**
	 * @return
	 */
	@Column(name = "catalog_name" )
	public java.lang.String getCatalogName() {
		return this.catalogName;
	}

	public void setCatalogName(java.lang.String value) {
		this.catalogName = value;
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
	@JoinTable(name = Constants.TABLE_PREFIX + "government_catalog_attach", joinColumns = { @JoinColumn(name = "catalog_id") }, inverseJoinColumns = { @JoinColumn(name = "attach_id") })
	public List<Attach> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<Attach> attachList) {
		this.attachList = attachList;
	}
	
	@ManyToMany
	@JoinTable(name = Constants.TABLE_PREFIX + "government_catalog_user", joinColumns = { @JoinColumn(name = "catalog_id") }, inverseJoinColumns = { @JoinColumn(name = "user_id") })
	public List<User> getFarmList() {
		return farmList;
	}

	public void setFarmList(List<User> farmList) {
		this.farmList = farmList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}

