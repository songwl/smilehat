package com.smilehat.business.service.;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity..CertLabel;
import com.smilehat.business.repository..CertLabelDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class CertLabelService extends BaseService<CertLabel>{
	private static Logger logger = LoggerFactory.getLogger(CertLabelService.class);
  
	@Autowired
	private CertLabelDao certLabelDao;

    
  	
	@Override
	public PagingAndSortingRepository<CertLabel, Long> getPagingAndSortingRepositoryDao() {
		return this.certLabelDao;
	}

	@Override
	public JpaSpecificationExecutor<CertLabel> getJpaSpecificationExecutorDao() {
		return this.certLabelDao;
	}
	
}
