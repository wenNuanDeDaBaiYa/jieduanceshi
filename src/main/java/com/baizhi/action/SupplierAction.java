package com.baizhi.action;

import com.baizhi.entity.Supplier;
import com.baizhi.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/supplier")
public class SupplierAction {
    @Autowired
    private SupplierService supplierService;

    @RequestMapping("/SelectAll")
    @ResponseBody
    public Map<String,Object> SelectAll(Integer page,Integer rows){
        //System.out.println(page+"---"+rows);
        HashMap<String,Object> maps = new HashMap<>();
        List<Supplier> rowss = supplierService.selectAll(page, rows);
        //获取总数据条数
        Integer count = supplierService.count();
        //总页数
        Integer total;
        if(count%rows==0){
            total=count/rows;
        }else {
            total=count/rows+1;
        }
        maps.put("total",total);//总页数
        maps.put("records",count);
        maps.put("page",page);
        maps.put("rows",rowss);
        return maps;
    }
    @RequestMapping("/dml")
    @ResponseBody
    public void dml(String oper,Supplier supplier)throws Exception{
        if("add".equals(oper)){
            supplierService.add(supplier);
        }else if("edit".equals(oper)){
            supplierService.update(supplier);
        }else if("del".equals(oper)){
            supplierService.deleteByID(supplier.getId());
        }
    }
   /* public Map<String,Object> sousuo(Integer page,Integer rows,List<String> sousuo,){

        HashMap<String, Object> maps = new HashMap<String, Object>();
        List<Supplier> rowss = supplierService.selectAll(page, rows);
        //获取总数据条数
        Integer count = supplierService.count();
        //总页数
        Integer total;
        if(count%rows==0){
            total=count/rows;
        }else {
            total=count/rows+1;
        }
        maps.put("total",total);//总页数
        maps.put("records",count);
        maps.put("page",page);
        maps.put("rows",rowss);
        return maps;

    }*/
}
