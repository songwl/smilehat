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
@Table(name = Constants.TABLE_PREFIX +"purchase")
public class Purchase extends IdEntity {

	 
     private java.lang.Long userId;
     private java.lang.Long categoryId;
     private java.lang.String title;
     private java.lang.String description;
     private java.lang.Double quantity;
     private java.lang.String quantityUnit;
     private java.lang.Double price;
     private java.lang.String priceUnit;
     private java.util.Date createTime;
     private java.util.Date updateTime;
     private java.util.Date publishTime;
	 

	
	/**
	 * @return
	 */
	@Column(name = "user_id" )
	public java.lang.Long getUserId() {
		return this.userId;
	}
	
	public void setUserId(java.lang.Long value) {
		this.userId = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "category_id" )
	public java.lang.Long getCategoryId() {
		return this.categoryId;
	}
	
	public void setCategoryId(java.lang.Long value) {
		this.categoryId = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "title" )
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String value) {
		this.title = value;
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
	@Column(name = "quantity" )
	public java.lang.Double getQuantity() {
		return this.quantity;
	}
	
	public void setQuantity(java.lang.Double value) {
		this.quantity = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "quantity_unit" )
	public java.lang.String getQuantityUnit() {
		return this.quantityUnit;
	}
	
	public void setQuantityUnit(java.lang.String value) {
		this.quantityUnit = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "price" )
	public java.lang.Double getPrice() {
		return this.price;
	}
	
	public void setPrice(java.lang.Double value) {
		this.price = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "price_unit" )
	public java.lang.String getPriceUnit() {
		return this.priceUnit;
	}
	
	public void setPriceUnit(java.lang.String value) {
		this.priceUnit = value;
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
	 * @return
	 */
	@Column(name = "update_time" )
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	
	/**
	 * @return
	 */
	@Column(name = "publish_time" )
	public java.util.Date getPublishTime() {
		return this.publishTime;
	}
	
	public void setPublishTime(java.util.Date value) {
		this.publishTime = value;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

