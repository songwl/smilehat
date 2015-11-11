package com.smilehat.business.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.smilehat.modules.repository.BaseDao;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;

/**
 * 
 * @author yang
 *
 */
public interface PurchaseDao extends BaseDao<Purchase> {
//	@Query("select p.id from Purchase p where p.category.id=?")
//	List<Purchase> findPurchaseByCategoryID(Long categoryId);
}
