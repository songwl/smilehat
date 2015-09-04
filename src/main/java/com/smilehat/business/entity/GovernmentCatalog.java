package com.smilehat.business.entity;

import javax.persistence.*; 

import com.smilehat.constants.Constants;

import org.apache.commons.lang3.builder.ToStringBuilder;

import java.util.*;

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
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

