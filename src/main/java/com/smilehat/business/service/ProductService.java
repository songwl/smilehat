package com.smilehat.business.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.core.service.security.UserService;
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
public class ProductService extends BaseService<Product> {
	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Autowired
	private ProductDao productDao;

	@Autowired
	private RegionService regionService;

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	@Override
	public PagingAndSortingRepository<Product, Long> getPagingAndSortingRepositoryDao() {
		return this.productDao;
	}

	@Override
	public JpaSpecificationExecutor<Product> getJpaSpecificationExecutorDao() {
		return this.productDao;
	}

	public void saveProduct(Product product, Long regionId, Long userId, Long categoryId) {
		if (regionId != null) {
			product.setRegion(regionService.getObjectById(regionId));
		}
		if (userId != null) {
			product.setUser(userService.getObjectById(userId));
		}

		if (categoryId != null) {
			product.setCategory(categoryService.getObjectById(categoryId));
		}
		this.save(product);
	}

}
