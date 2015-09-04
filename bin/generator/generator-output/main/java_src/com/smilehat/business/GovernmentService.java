package com.smilehat.business.service.;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity..Government;
import com.smilehat.business.repository..GovernmentDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class GovernmentService extends BaseService<Government>{
	private static Logger logger = LoggerFactory.getLogger(GovernmentService.class);
  
	@Autowired
	private GovernmentDao governmentDao;

    
  	
	@Override
	public PagingAndSortingRepository<Government, Long> getPagingAndSortingRepositoryDao() {
		return this.governmentDao;
	}

	@Override
	public JpaSpecificationExecutor<Government> getJpaSpecificationExecutorDao() {
		return this.governmentDao;
	}
	
}
