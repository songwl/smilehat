package com.smilehat.modules.shiro;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.smilehat.modules.entity.MapBean;
import com.smilehat.modules.ibatis.IbatisQueryDao;

public class DBDefinitionsService {
	private static Logger logger = LoggerFactory.getLogger(DBDefinitionsService.class);
	private String filterName = "permsany";
	private String sysfilters = ""; //系统过滤器，将不用授权过滤器来处理。用于在现有的后台授权配置中，可以根据需要配置系统过滤器。
	private IbatisQueryDao ibatisDao;
	private String urls;
	private String prefix = "";
	private String sqlId = "listshiro.resource_authority";

	public String getFilterName() {
		return filterName;
	}

	public void setFilterName(String filterName) {
		this.filterName = filterName;
	}

	/**
	 * 系统过滤器，将不用授权过滤器来处理。用于在现有的后台授权配置中，可以根据需要配置系统过滤器。
	 * 多个间用,分隔
	 * 如，数据库中配置 /sys/**需要系统权限，但又要求/sys/attachType/**不受权限控制（本身url配置不够合理导致）
	 * @param sysfilter
	 */
	public void setSysfilters(String sysfilters) {
		if (StringUtils.isNotBlank(sysfilters)) {
			if (!sysfilters.startsWith(",")) {
				sysfilters = "," + sysfilters;
			}
			if (!sysfilters.endsWith(",")) {
				sysfilters = sysfilters + ",";
			}
			this.sysfilters = sysfilters;
		}
	}

	public IbatisQueryDao getIbatisDao() {
		return ibatisDao;
	}

	public void setIbatisDao(IbatisQueryDao ibatisDao) {
		this.ibatisDao = ibatisDao;
	}

	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}

	public String getPrefix() {
		return prefix;
	}

	public String getSqlId() {
		return sqlId;
	}

	public void setSqlId(String sqlId) {
		this.sqlId = sqlId;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getDefinitions() {
		StringBuffer strb = new StringBuffer();

		List<MapBean<String, Object>> resourceAuthorityList = ibatisDao.findAll(sqlId, null);
		String url;
		String permission;
		Map<String, Set<String>> map = Maps.newLinkedHashMap();
		Map<String, Boolean> sysfilterMap = Maps.newHashMap();
		for (MapBean<String, Object> resourceAuthority : resourceAuthorityList) {
			url = (String) resourceAuthority.get("url");
			permission = (String) resourceAuthority.get("permission");
			if (isSysFilter(permission)) {
				sysfilterMap.put(url, true);
			}
			if (map.containsKey(url)) {
				map.get(url).add(permission);
			} else {
				Set<String> s = Sets.newHashSet(permission);
				map.put(url, s);
			}
		}
		for (Iterator<Map.Entry<String, Set<String>>> iterator = map.entrySet().iterator(); iterator.hasNext();) {
			Map.Entry<String, Set<String>> entry = iterator.next();
			strb.append(prefix).append(entry.getKey()).append(" = ");
			//该url已经配置了系统过滤器，则直接输出过滤器配置，不需要授权过滤器
			if (sysfilterMap.get(entry.getKey()) != null) {
				strb.append(StringUtils.join(entry.getValue(), ","));
			} else {
				strb.append(filterName).append("[\"").append(StringUtils.join(entry.getValue(), ",")).append("\"]");
			}
			strb.append("\n");
		}

		if (StringUtils.isNotEmpty(urls)) {
			strb.append(urls);
		}
		logger.debug("安全框架URL权限配置:" + strb.toString());
		return strb.toString();
	}

	private boolean isSysFilter(String str) {
		if (StringUtils.isNotBlank(this.sysfilters)) {
			return this.sysfilters.indexOf("," + str + ",") != -1;
		}
		return false;
	}
}
