package com.smilehat.business.entity.sys;

import javax.persistence.*; 
import com.smilehat.constants.Constants;
import org.apache.commons.lang3.builder.ToStringBuilder;
import java.util.*;
import com.vsc.modules.entity.IdEntity;

 

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX +"category")
public class Category extends IdEntity {

	 
     private java.lang.String categoryName;
     private java.lang.String categoryCode;
     private java.lang.Long parentId;
     private java.lang.Integer sort;
     private java.util.Date createTime;
	 

	
	/**
	 * @return
	 */
	@Column(name = "category_name" )
	public java.lang.String getCategoryName() {
		return this.categoryName;
	}
	
	public void setCategoryName(java.lang.String value) {
		this.categoryName = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "category_code" )
	public java.lang.String getCategoryCode() {
		return this.categoryCode;
	}
	
	public void setCategoryCode(java.lang.String value) {
		this.categoryCode = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "parent_id" )
	public java.lang.Long getParentId() {
		return this.parentId;
	}
	
	public void setParentId(java.lang.Long value) {
		this.parentId = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "sort" )
	public java.lang.Integer getSort() {
		return this.sort;
	}
	
	public void setSort(java.lang.Integer value) {
		this.sort = value;
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

