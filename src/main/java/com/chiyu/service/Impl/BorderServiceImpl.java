package com.chiyu.service.Impl;

import com.chiyu.dao.BorderDao;
import com.chiyu.entity.BorderEntity;
import com.chiyu.service.BorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorderServiceImpl implements BorderService {
    private BorderDao borderDao;

    public BorderDao getBorderDao() {
        return borderDao;
    }

    //使用Spring Bean自动赋值
    @Autowired
    public void setBorderDao(BorderDao borderDao) {
        this.borderDao = borderDao;
    }

    @Override
    public BorderEntity insertOrUpdateBorder(BorderEntity order) {
        borderDao.save(order);
        return borderDao.findById(order.getOid()).orElse(null);
    }

    @Override
    public void deleteBorder(String id) {
        borderDao.deleteById(id);
    }

    @Override
    public List<BorderEntity> findAllBorders() {
        return borderDao.findAll();
    }

    @Override
    public BorderEntity findBorderById(String id) {
        return borderDao.findById(id).orElse(null);
    }
}
