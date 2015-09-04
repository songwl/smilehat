package com.smilehat.modules.spring.mvc.bind.model;

/**
 * 用于嵌套接收ID数组
 *
 */
public class IdsForm {

	private Long[] id;

	public Long[] getId() {
		return id;
	}

	public void setId(Long[] id) {
		this.id = id;
	}

}
