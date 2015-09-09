package com.smilehat.business.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smilehat.business.core.entity.security.User;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.repository.CustomerDao;
import com.smilehat.modules.service.BaseService;
import com.smilehat.util.CoreUtils;
import com.smilehat.util.MD5Util;

/**
 * 
 * @author yang
 *
 */
@Service
@Transactional
public class CustomerService extends BaseService<Customer> {
	private static Logger logger = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;

	@Override
	public PagingAndSortingRepository<Customer, Long> getPagingAndSortingRepositoryDao() {
		return this.customerDao;
	}

	@Override
	public JpaSpecificationExecutor<Customer> getJpaSpecificationExecutorDao() {
		return this.customerDao;
	}

	@Autowired
	private ProductService productService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private UserService userService;

	@Autowired
	private AttachService attachService;

	@Autowired
	private RegionService regionService;

	public void createCustomer(Customer customer, Long photoAttachId, Long regionId) {
		User user = customer.getUser();
		user.setPassword(MD5Util.MD5(user.getPlainPassword()));
		user.setCreateTime(CoreUtils.nowtime());
		user.setUpdateTime(CoreUtils.nowtime());
		user.setRegisterDate(CoreUtils.nowtime());
		if (photoAttachId != null) {
			user.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		}
		Long[] roleIds = new Long[] { 1L };
		userService.save(user, roleIds);

		if (regionId != null) {
			customer.setRegion(regionService.getObjectById(regionId));
		}
		this.save(customer);
	}

	public void saveCustomer(Customer customer, Long photoAttachId, Long regionId) {
		User user = customer.getUser();
		user.setUpdateTime(CoreUtils.nowtime());
		if (photoAttachId != null) {
			user.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		}
		if (photoAttachId != null) {
			user.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		}
		userService.save(user);

		if (regionId != null) {
			customer.setRegion(regionService.getObjectById(regionId));
		}
		this.save(customer);
	}

	/**
	 * 删除商户
	 * 同时删除该商户产品信息和发布的供求信息
	 * @param id
	 */
	public void deleteCustomer(Long id) {
		Customer customer = customerDao.findOne(id);
		customer.setIsDeleted(Boolean.TRUE);
		this.save(customer);

		User user = customer.getUser();
		user.setIsDeleted(Boolean.TRUE);
		userService.save(user);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("EQ_user", user);
		params.put("EQ_isDeleted", Boolean.FALSE);

		//删除产品信息
		List<Product> productList = productService.findList(params);
		if (!CollectionUtils.isEmpty(productList)) {
			for (Product product : productList) {
				product.setIsDeleted(Boolean.TRUE);
			}
			productService.save(productList);
		}

		//删除采购信息
		List<Purchase> purchaseList = purchaseService.findList(params);
		if (!CollectionUtils.isEmpty(purchaseList)) {
			for (Purchase purchase : purchaseList) {
				purchase.setIsDeleted(Boolean.TRUE);
			}
			purchaseService.save(purchaseList);
		}
	}

	public void deleteCustomers(Long[] ids) {
		for (Long id : ids) {
			deleteCustomer(id);
		}
	}

	/**
	 * 商户审核
	 * @param customer
	 */
	public void auditCustomer(Customer customer) {
		Long[] roleIds = new Long[] { 7L };
		userService.save(customer.getUser(), roleIds);
	}

}
