package com.smilehat.business.service.;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity..GovernmentCatalog;
import com.smilehat.business.repository..GovernmentCatalogDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class GovernmentCatalogService extends BaseService<GovernmentCatalog>{
	private static Logger logger = LoggerFactory.getLogger(GovernmentCatalogService.class);
  
	@Autowired
	private GovernmentCatalogDao governmentCatalogDao;

    
  	
	@Override
	public PagingAndSortingRepository<GovernmentCatalog, Long> getPagingAndSortingRepositoryDao() {
		return this.governmentCatalogDao;
	}

	@Override
	public JpaSpecificationExecutor<GovernmentCatalog> getJpaSpecificationExecutorDao() {
		return this.governmentCatalogDao;
	}
	
}
