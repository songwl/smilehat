package com.smilehat.business.core.repository.sys;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.smilehat.business.core.entity.sys.Dict;
import com.smilehat.modules.repository.BaseDao;

/**
 * 
 *
 */
public interface DictDao extends BaseDao<Dict> {

	@Query("select distinct dict.type from Dict dict order by dict.sort")
	List<String> findAllType();

}
