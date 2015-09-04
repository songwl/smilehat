package com.smilehat.business.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.smilehat.constants.Constants;
import com.smilehat.modules.entity.IdEntity;

 

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX +"region")
public class Region extends IdEntity {

	 
     private java.lang.String regionCode;//区域代码
     private java.lang.String regionName;//区域名称
     private java.lang.Integer regionLevel;//区域等级
     private java.lang.Integer regionSort;//区域顺序
     private java.lang.String regionNameEn;//区域英文名称
     private java.lang.String regionShortnameEn;//区域英文名称缩写
     
	private Region parent;//父级区域
	 
	
	/**
	 * @return
	 */
	@Column(name = "region_code" )
	public java.lang.String getRegionCode() {
		return this.regionCode;
	}
	
	public void setRegionCode(java.lang.String value) {
		this.regionCode = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "region_name" )
	public java.lang.String getRegionName() {
		return this.regionName;
	}
	
	public void setRegionName(java.lang.String value) {
		this.regionName = value;
	}
	
	
	/**
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name = "parent_id")
	public Region getParent() {
		return parent;
	}

	public void setParent(Region parent) {
		this.parent = parent;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "region_level" )
	public java.lang.Integer getRegionLevel() {
		return this.regionLevel;
	}
	
	public void setRegionLevel(java.lang.Integer value) {
		this.regionLevel = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "region_sort" )
	public java.lang.Integer getRegionSort() {
		return this.regionSort;
	}
	
	public void setRegionSort(java.lang.Integer value) {
		this.regionSort = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "region_name_en" )
	public java.lang.String getRegionNameEn() {
		return this.regionNameEn;
	}
	
	public void setRegionNameEn(java.lang.String value) {
		this.regionNameEn = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "region_shortname_en" )
	public java.lang.String getRegionShortnameEn() {
		return this.regionShortnameEn;
	}
	
	public void setRegionShortnameEn(java.lang.String value) {
		this.regionShortnameEn = value;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

