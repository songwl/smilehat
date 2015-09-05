package com.smilehat.business.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.google.common.collect.Lists;
import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

 

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX +"category")
public class Category extends IdEntity {

	 
     private java.lang.String categoryName;//品类名称
     private java.lang.String categoryCode;//品类代码
     //private java.lang.Long parentId;
     private java.lang.Integer sort;//品类顺序
     private java.util.Date createTime;//创建时间
     
	 private Category parent;//父级品类
	 
	 private List<Category> children = Lists.newArrayList();

	
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
	@ManyToOne
	@JoinColumn(name = "parent_id")
	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
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
	
	/**
	 * 一个父栏目有多个子栏目
	 * @return
	 */
	@OneToMany(mappedBy = "parent")
	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

