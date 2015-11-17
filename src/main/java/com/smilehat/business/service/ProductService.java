package com.smilehat.business.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.entity.Category;
import com.smilehat.business.entity.CertLabel;
import com.smilehat.business.entity.Product;
import com.smilehat.business.repository.CertLabelDao;
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

	@Autowired
	private CertLabelDao certLabelDao;

	@Autowired
	private AttachService attachService;

	@Override
	public PagingAndSortingRepository<Product, Long> getPagingAndSortingRepositoryDao() {
		return this.productDao;
	}

	@Override
	public JpaSpecificationExecutor<Product> getJpaSpecificationExecutorDao() {
		return this.productDao;
	}

	public void saveProduct(Product product, Long regionId, Long userId, Long categoryId, List<CertLabel> certLabelList, Long[] attachIds) {
		if (regionId != null) {
			product.setRegion(regionService.getObjectById(regionId));
		}
		if (userId != null) {
			product.setUser(userService.getObjectById(userId));
		}

		if (categoryId != null) {
			product.setCategory(categoryService.getObjectById(categoryId));
		}

		if (!CollectionUtils.isEmpty(certLabelList)) {
			product.setCertLabelList(certLabelList);
		}

		if (product.getPrice() == null) {
			product.setPrice(0.0);
		}

		if (product.getPrice2() == null) {
			product.setPrice2(0.0);
		}
		if (attachIds != null && attachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : attachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				product.setAttachs(attachs);
			}
		}

		this.save(product);
	}

	public List<Category> findCategoryListByProduct() {
		List<Category> list = productDao.findDistinctCategory();

		Map<Long, Category> map = new HashMap<>();

		for (Category category : list) {
			if (map.containsKey(category.getParent().getId())) {
				Category parent = map.get(category.getParent().getId());
				parent.getChildren().add(category);
			} else {
				Category parent = category.getParent();
				List<Category> children = new ArrayList<>();
				children.add(category);
				parent.setChildren(children);
				map.put(category.getParent().getId(), parent);
			}
		}

		List<Category> parents = new ArrayList<>();
		for (Category c : map.values()) {
			parents.add(c);
		}

		return parents;
	}

	public List<Category> findCategoryListByProductUser(Long userId) {
		List<Category> list = productDao.findDistinctUserCategory(userId);
		return list;
	}
	
	public List<Category> findCategoryParentListByProductUser(Long userId) {
		List<Category> list = productDao.findDistinctUserCategoryParent(userId);
		return list;
	}

	//	public List<Product> findProductListByCategoryID(Long categoryId) {
	//		List<Product> list = productDao.findProductByCategoryID(categoryId);
	//		return list;
	//	}
}
