package com.baizhi.cache;


import com.baizhi.util.SpringContextUtil;
import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.concurrent.locks.ReadWriteLock;

public class RedisCache implements Cache {

    private String id;

    public RedisCache(String id) {
        this.id = id;
    }


    @Override
    public String getId() {
       return id;

    }
    //把数据放入缓存中
    @Override
    public void putObject(Object key, Object value) {
    //获取redis的RedisTime对象
        RedisTemplate redisTemplate = (RedisTemplate)SpringContextUtil.getContext().getBean("redisTemplate");
        //把相对应的数据放入缓存中
        redisTemplate.opsForHash().put(id,key,value);
    }

    //从缓存中获取数据
    @Override
    public Object getObject(Object key) {
        RedisTemplate redisTemplate = (RedisTemplate)SpringContextUtil.getContext().getBean("redisTemplate");
        Object o = redisTemplate.opsForHash().get(id, key);
        return o;
    }

    //增删改清空缓存
    @Override
    public Object removeObject(Object key) {
        RedisTemplate redisTemplate = (RedisTemplate)SpringContextUtil.getContext().getBean("redisTemplate");
        redisTemplate.opsForHash().delete(id, key);
        return null;
    }

    //增删改清空缓存
    @Override
    public void clear() {
        RedisTemplate redisTemplate = (RedisTemplate)SpringContextUtil.getContext().getBean("redisTemplate");
        redisTemplate.delete(id);

    }

    //获取长度
    @Override
    public int getSize() {
        RedisTemplate redisTemplate = (RedisTemplate)SpringContextUtil.getContext().getBean("redisTemplate");
        Long size = redisTemplate.opsForHash().size(id);
        return size.intValue();//(intValue类型转换)
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return null;
    }
}
