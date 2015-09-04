package com.smilehat.business.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.repository.PurchaseDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class PurchaseService extends BaseService<Purchase>{
	private static Logger logger = LoggerFactory.getLogger(PurchaseService.class);
  
	@Autowired
	private PurchaseDao purchaseDao;

    
  	
	@Override
	public PagingAndSortingRepository<Purchase, Long> getPagingAndSortingRepositoryDao() {
		return this.purchaseDao;
	}

	@Override
	public JpaSpecificationExecutor<Purchase> getJpaSpecificationExecutorDao() {
		return this.purchaseDao;
	}
	
}
