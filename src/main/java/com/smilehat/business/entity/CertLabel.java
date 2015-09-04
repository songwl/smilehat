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
@Table(name = Constants.TABLE_PREFIX +"certLabel")
public class CertLabel extends IdEntity {

	 
     private java.lang.String certName;//认证标签名称
     private java.lang.Integer isAllowCheck;//是否用户可选择
     private java.lang.String certDesc;//认证说明
     private java.lang.String certType;//认证类型
     private java.lang.String certType2;//认证类型二级分类
     private  java.lang.Integer sort;//排序字段
	 

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
	@Column(name = "cert_name" )
	public java.lang.String getCertName() {
		return this.certName;
	}
	
	public void setCertName(java.lang.String value) {
		this.certName = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "is_allow_check" )
	public java.lang.Integer getIsAllowCheck() {
		return this.isAllowCheck;
	}
	
	public void setIsAllowCheck(java.lang.Integer value) {
		this.isAllowCheck = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "cert_desc" )
	public java.lang.String getCertDesc() {
		return this.certDesc;
	}
	
	public void setCertDesc(java.lang.String value) {
		this.certDesc = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "cert_type" )
	public java.lang.String getCertType() {
		return this.certType;
	}
	
	public void setCertType(java.lang.String value) {
		this.certType = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "cert_type2" )
	public java.lang.String getCertType2() {
		return this.certType2;
	}
	
	public void setCertType2(java.lang.String value) {
		this.certType2 = value;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

