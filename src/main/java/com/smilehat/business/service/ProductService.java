package com.smilehat.business.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smilehat.business.entity.Product;
import com.smilehat.business.repository.ProductDao;
import com.smilehat.modules.service.BaseService;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class ProductService extends BaseService<Product>{
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);
  
	@Autowired
	private ProductDao productDao;

    
  	
	@Override
	public PagingAndSortingRepository<Product, Long> getPagingAndSortingRepositoryDao() {
		return this.productDao;
	}

	@Override
	public JpaSpecificationExecutor<Product> getJpaSpecificationExecutorDao() {
		return this.productDao;
	}
	
}
