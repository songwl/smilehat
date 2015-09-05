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
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.repository.CustomerDao;
import com.smilehat.modules.service.BaseService;

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

	/**
	 * 删除商户
	 * 同时删除该商户产品信息和发布的供求信息
	 * @param id
	 */
	public void deleteCustomer(Long id) {
		Customer customer = customerDao.findOne(id);
		customer.setIsDeleted(Boolean.TRUE);

		User user = customer.getUser();
		user.setIsDeleted(Boolean.TRUE);

		this.save(customer);

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
}
