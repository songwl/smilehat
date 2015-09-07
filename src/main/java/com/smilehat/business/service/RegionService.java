package com.smilehat.business.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.Region;
import com.smilehat.business.repository.RegionDao;
import com.smilehat.modules.service.BaseService;

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
	
	/**
	 * 判断某个栏目是不是另一个栏目的上级(不限层次)栏目
	 * id的上级栏目包括pid 返回 true,否则返回flase
	 * @param id 目标栏目 
	 * @param pid 上级栏目ID
	 * @return 
	 */
	public Boolean isParent(Long id, Long pid) {
		if (id == null || pid == null) {
			return false;
		}
		Region obj = this.regionDao.findOne(id);
		if (obj != null) {
			return isParent(obj, pid);
		}
		return false;
	}
	
	private Boolean isParent(Region obj, Long pid) {
		if (obj != null) {
			if (obj.getParent() != null) {
				if (obj.getParent().getId().equals(pid)) {
					return true;
				} else {
					return isParent(obj.getParent(), pid);
				}
			}
			return false;
		}
		return false;
	}
}
