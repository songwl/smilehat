package com.smilehat.business.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.entity.Product;
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
public class PurchaseService extends BaseService<Purchase> {
	private static Logger logger = LoggerFactory.getLogger(PurchaseService.class);

	@Autowired
	private PurchaseDao purchaseDao;

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private RegionService regionService;

	@Override
	public PagingAndSortingRepository<Purchase, Long> getPagingAndSortingRepositoryDao() {
		return this.purchaseDao;
	}

	@Override
	public JpaSpecificationExecutor<Purchase> getJpaSpecificationExecutorDao() {
		return this.purchaseDao;
	}

	public void savePurchase(Purchase purchase, Long userId, Long categoryId,Long regionId) {
		if (userId != null) {
			purchase.setUser(userService.getObjectById(userId));
		}

		if (categoryId != null) {
			purchase.setCategory(categoryService.getObjectById(categoryId));
		}
		if (regionId != null) {
			purchase.setRegion(regionService.getObjectById(regionId));
		}
		this.save(purchase);

	}
	
//	public List<Purchase> findPurchaseListByCategoryID(Long categoryId) {
//		List<Purchase> list = purchaseDao.findPurchaseByCategoryID(categoryId);
//		return list;
//	}

}
