package com.smilehat.business.service.sys;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity.sys.Region;
import com.smilehat.business.repository.sys.RegionDao;
import com.vsc.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class RegionService extends BaseService<Region>{
	private static Logger logger = LoggerFactory.getLogger(RegionService.class);
  
	@Autowired
	private RegionDao regionDao;

    
  	
	@Override
	public PagingAndSortingRepository<Region, Long> getPagingAndSortingRepositoryDao() {
		return this.regionDao;
	}

	@Override
	public JpaSpecificationExecutor<Region> getJpaSpecificationExecutorDao() {
		return this.regionDao;
	}
	
}
