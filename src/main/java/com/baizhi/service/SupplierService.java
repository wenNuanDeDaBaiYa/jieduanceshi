package com.baizhi.service;

import com.baizhi.entity.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupplierService {
    //展示所有分页
    public List<Supplier> selectAll(Integer page, Integer rows);
    //数据总条数
    public Integer count();
    //添加
    public void add(Supplier supplier);
    //修改
    public void update(Supplier supplier);
    //删除
    public void deleteByID(String id);
}
