package com.smilehat.business.integration.dao;

import java.util.*;
import com.vsc.modules.entity.IdEntity;

 

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.vsc.auth.dao.ProductDao;
import com.vsc.auth.entity.Product;

public class ProductDaoTest extends SpringTxTestCase{
    @Autowired
	private ProductDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Product entity = new Product();

        //请填写默认数据代码

		entityDao.save(entity);
		flush();

		//find entity.
		Product entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);

		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}
