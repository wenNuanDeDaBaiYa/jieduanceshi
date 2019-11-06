package com.baizhi.service;

import com.baizhi.dao.SupplierDao;
import com.baizhi.entity.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

    @Service
    @Transactional
    public class SupplierServiceImpl implements SupplierService{

        @Autowired
        private SupplierDao supplierDao;
        @Override
        @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
        public List<Supplier> selectAll(Integer page, Integer rows) {
            System.out.println(page+rows+"--------------");
            List<Supplier> list = supplierDao.selectAll(page, rows);
            return list;
        }

        @Override
        @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
        public Integer count() {
            Integer count = supplierDao.count();
            return count;
        }

        @Override
        public void add(Supplier supplier) {
            supplier.setCreateDate(new Date());
            supplier.setId(UUID.randomUUID().toString());
            System.out.println(supplier+"------------------pppppp");
            supplierDao.add(supplier);
        }
        @Override
        public void update(Supplier supplier) {
            supplierDao.update(supplier);
        }

        @Override
        public void deleteByID(String id) {

            supplierDao.deleteByID(id);
        }
}
