package com.smilehat.business.integration.dao;

import java.util.*;
import com.vsc.modules.entity.IdEntity;

 

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.vsc.auth.dao.PurchaseDao;
import com.vsc.auth.entity.Purchase;

public class PurchaseDaoTest extends SpringTxTestCase{
    @Autowired
	private PurchaseDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		Purchase entity = new Purchase();

        //请填写默认数据代码

		entityDao.save(entity);
		flush();

		//find entity.
		Purchase entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);

		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}
