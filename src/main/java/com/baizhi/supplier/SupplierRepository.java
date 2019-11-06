package com.baizhi.supplier;

import com.baizhi.entity.Supplier;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

public interface SupplierRepository extends ElasticsearchRepository<Supplier,String> {
    //自定义查询
    //通过供应商ID
    public List<Supplier> findByID(String id);
    //供应商名称
    public List<Supplier> findByName(String name);
    //负责人
    public List<Supplier> findByLeader(String leader);
    //电话号码
    public List<Supplier> findByPhone(String Phone);

}
