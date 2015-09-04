package com.smilehat.business.entity.sys;

import javax.persistence.*; 
import com.vsc.constants.Constants;
import org.apache.commons.lang3.builder.ToStringBuilder;
import java.util.*;
import com.vsc.modules.entity.IdEntity;

 

/**
 * 
 * @author yang
 *
 */
@Entity
@Table(name = Constants.TABLE_PREFIX +"region")
public class Region extends IdEntity {

	 
     private java.lang.String regionCode;
     private java.lang.String regionName;
     private java.lang.Long parentId;
     private java.lang.Integer regionLevel;
     private java.lang.Integer regionSort;
     private java.lang.String regionNameEn;
     private java.lang.String regionShortnameEn;
	 

	
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

