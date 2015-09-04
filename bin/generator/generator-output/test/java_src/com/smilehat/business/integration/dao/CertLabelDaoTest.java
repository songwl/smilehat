package com.smilehat.business.integration.dao;

import java.util.*;
import com.vsc.modules.entity.IdEntity;

 

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.test.spring.SpringTxTestCase;

import com.vsc.auth.dao.CertLabelDao;
import com.vsc.auth.entity.CertLabel;

public class CertLabelDaoTest extends SpringTxTestCase{
    @Autowired
	private CertLabelDao entityDao;

	@Test
	public void crudEntity() {
		//new entity and save it. 
		CertLabel entity = new CertLabel();

        //请填写默认数据代码

		entityDao.save(entity);
		flush();

		//find entity.
		CertLabel entityFromDB = entityDao.findUniqueBy("id", entity.getId());
		assertReflectionEquals(entity, entityFromDB);

		//delete entity.
		entityDao.delete(entity.getId());
		flush();
		entity = entityDao.findUniqueBy("id", entity.getId());
		assertNull(entity);
	}
}
