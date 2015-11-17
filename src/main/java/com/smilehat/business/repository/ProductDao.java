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

	@Query("select distinct p.category from Product p where p.user.id=?")
	List<Category> findDistinctUserCategory(Long userId);

	@Query("select distinct p.category.parent from Product p where p.user.id=?")
	List<Category> findDistinctUserCategoryParent(Long userId);
	
//	@Query("select p from Product p where p.category.id=?")
//	List<Product> findProductByCategoryID(Long categoryId);
}
