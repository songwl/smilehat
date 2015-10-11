package com.smilehat.business.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.entity.GovernmentCatalog;
import com.smilehat.business.repository.GovernmentCatalogDao;
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

    @Autowired
    private AttachService attachService;
    
    @Autowired
    private UserService userService;
  	
	@Override
	public PagingAndSortingRepository<GovernmentCatalog, Long> getPagingAndSortingRepositoryDao() {
		return this.governmentCatalogDao;
	}

	@Override
	public JpaSpecificationExecutor<GovernmentCatalog> getJpaSpecificationExecutorDao() {
		return this.governmentCatalogDao;
	}

	public void saveGovernmentCatalog(GovernmentCatalog governmentCatalog,
			Long[] attachIds, Long[] farmIds) {
		if (attachIds != null && attachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : attachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				governmentCatalog.setAttachList(attachs);
			}
		}
		
		if (farmIds != null && farmIds.length > 0) {
			List<User> farms = new ArrayList<User>();
			for (Long id : farmIds) {
				if (id != null) {
					farms.add(userService.getObjectById(id));
				}
			}

			if (!farms.isEmpty()) {
				governmentCatalog.setFarmList(farms);
			}
		}
		
		governmentCatalogDao.save(governmentCatalog);
		
	}
	
}
