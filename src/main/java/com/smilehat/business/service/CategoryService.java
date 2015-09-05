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
	
	/**
	 * 关联父栏目并保存栏目
	 * @param entity 当前栏目
	 * @param pid 父栏目ID
	 * @return 保存后的栏目
	 */
	public Category save(Category entity, Long pid) {
		if (null == pid) {
			entity.setParent(null);
		} else {
			entity.setParent(categoryDao.findOne(pid));
		}
		return categoryDao.save(entity);

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
		Category obj = this.categoryDao.findOne(id);
		if (obj != null) {
			return isParent(obj, pid);
		}
		return false;
	}
	
	private Boolean isParent(Category obj, Long pid) {
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
