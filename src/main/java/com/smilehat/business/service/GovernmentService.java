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

import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.entity.Government;
import com.smilehat.business.repository.GovernmentDao;
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

    @Autowired
    private AttachService attachService;
    
    @Autowired
    private RegionService regionService;
  	
	@Override
	public PagingAndSortingRepository<Government, Long> getPagingAndSortingRepositoryDao() {
		return this.governmentDao;
	}

	@Override
	public JpaSpecificationExecutor<Government> getJpaSpecificationExecutorDao() {
		return this.governmentDao;
	}
	
	
	public void saveGovernment(Government government,Long regionId, Long[] attachIds){
		
		if(regionId!=null){
			government.setRegion(regionService.getObjectById(regionId));
		}
		
		if (attachIds != null && attachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : attachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				government.setAttachList(attachs);
			}
		}
		
		governmentDao.save(government);
	}
}
