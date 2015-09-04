package com.smilehat.business.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity.Category;
import com.smilehat.business.repository.CategoryDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class CategoryService extends BaseService<Category>{
	private static Logger logger = LoggerFactory.getLogger(CategoryService.class);
  
	@Autowired
	private CategoryDao categoryDao;

    
  	
	@Override
	public PagingAndSortingRepository<Category, Long> getPagingAndSortingRepositoryDao() {
		return this.categoryDao;
	}

	@Override
	public JpaSpecificationExecutor<Category> getJpaSpecificationExecutorDao() {
		return this.categoryDao;
	}
	
}
