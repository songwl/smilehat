package com.smilehat.business.service;

import java.util.ArrayList;
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
import com.smilehat.business.core.entity.sys.upload.Attach;
import com.smilehat.business.core.service.security.UserService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.entity.Customer;
import com.smilehat.business.entity.Product;
import com.smilehat.business.entity.Purchase;
import com.smilehat.business.repository.CustomerDao;
import com.smilehat.constants.Enums;
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

	public void createCustomer(Customer customer, Long[] identityAttachIds, Long[] attachIds, Long regionId, String backgroundColor) {
		User user = customer.getUser();
		user.setPassword(MD5Util.MD5(user.getPlainPassword()));
		user.setCreateTime(CoreUtils.nowtime());
		user.setUpdateTime(CoreUtils.nowtime());
		user.setRegisterDate(CoreUtils.nowtime());
		if (identityAttachIds != null && identityAttachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : identityAttachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				user.setIdentityAttachs(attachs);
			}
		}

		if (attachIds != null && attachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : attachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				user.setAttachs(attachs);
			}
		}
		if (backgroundColor != "") {
			user.setBackgroundColor(backgroundColor);
		} else if (backgroundColor == null) {
			user.setBackgroundColor(null);
		}
		Long[] roleIds = new Long[1];
		if (Enums.USER_TYPE.PERSON.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 13L;
		} else if (Enums.USER_TYPE.DEALER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 14L;
		} else if (Enums.USER_TYPE.FARMER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 15L;
		}
		userService.save(user, roleIds);

		if (regionId != null) {
			customer.setRegion(regionService.getObjectById(regionId));
		}
		this.save(customer);
	}

	public void saveCustomer(Customer customer, Long[] identityAttachIds, Long[] attachIds, Long regionId, String backgroundColor) {
		User user = customer.getUser();
		user.setUpdateTime(CoreUtils.nowtime());
		if (identityAttachIds != null && identityAttachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : identityAttachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				user.setIdentityAttachs(attachs);
			}
		}
		if (attachIds != null && attachIds.length > 0) {
			List<Attach> attachs = new ArrayList<Attach>();
			for (Long attachId : attachIds) {
				if (attachId != null) {
					attachs.add(attachService.findUniqueBy("id", attachId));
				}
			}

			if (!attachs.isEmpty()) {
				user.setAttachs(attachs);
			}
		}

		if (backgroundColor == null || backgroundColor.trim() == "") {
			user.setBackgroundColor(null);
		} else {
			user.setBackgroundColor(backgroundColor);
		}

		User oldUser = userService.getObjectById(user.getId());
		boolean changeUserType = !oldUser.getUserType().equalsIgnoreCase(user.getUserType());

		if (changeUserType) {
			Long[] roleIds = new Long[1];
			if (Enums.USER_TYPE.PERSON.name().equalsIgnoreCase(user.getUserType())) {
				roleIds[0] = 13L;
			} else if (Enums.USER_TYPE.DEALER.name().equalsIgnoreCase(user.getUserType())) {
				roleIds[0] = 14L; //未审核特约经销商
			} else if (Enums.USER_TYPE.FARMER.name().equalsIgnoreCase(user.getUserType())) {
				roleIds[0] = 15L; //未审核农场
			}
			userService.save(user, roleIds);
		} else {
			userService.save(user);
		}

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
	 * 商户审核通过
	 * @param customer
	 */
	public void auditCustomer(Customer customer) {
		User user = customer.getUser();
		Long[] roleIds = new Long[1];
		if (Enums.USER_TYPE.PERSON.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 3L;
		} else if (Enums.USER_TYPE.DEALER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 4L;
		} else if (Enums.USER_TYPE.FARMER.name().equalsIgnoreCase(user.getUserType())) {
			roleIds[0] = 5L;
		}
		userService.save(user, roleIds);
	}

}
