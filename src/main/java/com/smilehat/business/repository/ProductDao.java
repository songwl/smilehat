package com.smilehat.business.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.Product;
import com.smilehat.modules.repository.BaseDao;

/**
 * 
 * @author song
 *
 */
public interface ProductDao extends BaseDao<Product> {

	@Query("select distinct p.category from Product p")
	List<Category> findDistinctCategory();
}
