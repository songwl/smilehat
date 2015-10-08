package com.smilehat.constants;

public abstract class Enums {

	public static enum USER_TYPE {
		PERSON("个人"), DEALER("特约经销商"), FARMER("农场"), ADMIN("管理员");

		private String cnName;

		USER_TYPE(String cnName) {
			this.cnName = cnName;
		}

		public String getLabel() {
			return this.cnName;
		}
	}

	public static enum CERT_TYPE {
		PRODUCT, //产品标签
		CUSTOMER//商户标签
	}
}
