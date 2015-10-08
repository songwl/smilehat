package com.smilehat.business.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = Constants.TABLE_PREFIX + "certLabel")
public class CertLabel extends IdEntity {

	private java.lang.String certName;//认证标签名称
	private java.lang.Boolean isAllowCheck;//是否用户可选择 ,0是用户可选择，1是用户不可选择
	private java.lang.String certDesc;//认证说明
	private java.lang.String certType;//认证类型
	private java.lang.String certType2;//认证类型二级分类
	private java.lang.Integer sort;//排序字段
	private Attach photoAttach;//标签图标

	@ManyToOne
	@JoinColumn(name = "photo_attach_id")
	public Attach getPhotoAttach() {
		return photoAttach;
	}

	public void setPhotoAttach(Attach photoAttach) {
		this.photoAttach = photoAttach;
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
	@Column(name = "cert_name")
	public java.lang.String getCertName() {
		return this.certName;
	}

	public void setCertName(java.lang.String value) {
		this.certName = value;
	}

	/**
	 * @return
	 */
	@Column(name = "is_allow_check")
	public java.lang.Boolean getIsAllowCheck() {
		return this.isAllowCheck;
	}

	public void setIsAllowCheck(java.lang.Boolean value) {
		this.isAllowCheck = value;
	}

	/**
	 * @return
	 */
	@Column(name = "cert_desc")
	public java.lang.String getCertDesc() {
		return this.certDesc;
	}

	public void setCertDesc(java.lang.String value) {
		this.certDesc = value;
	}

	/**
	 * @return
	 */
	@Column(name = "cert_type")
	public java.lang.String getCertType() {
		return this.certType;
	}

	public void setCertType(java.lang.String value) {
		this.certType = value;
	}

	/**
	 * @return
	 */
	@Column(name = "cert_type2")
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
