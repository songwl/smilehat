package com.smilehat.business.entity.;

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
@Table(name = Constants.TABLE_PREFIX +"government")
public class Government extends IdEntity {

	 
     private java.lang.String name;
     private java.lang.String introduction;
     private java.lang.String description;
     private java.lang.String website;
     private java.lang.Long regionId;
     private java.lang.String regionDetail;
     private java.lang.String contact;
     private java.lang.Long attachId;
     private java.util.Date createTime;
	 

	
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
	@Column(name = "region_id" )
	public java.lang.Long getRegionId() {
		return this.regionId;
	}
	
	public void setRegionId(java.lang.Long value) {
		this.regionId = value;
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
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

