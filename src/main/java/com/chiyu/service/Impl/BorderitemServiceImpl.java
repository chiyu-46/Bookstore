package com.chiyu.service.Impl;

import com.chiyu.dao.BorderitemDao;
import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;
import com.chiyu.service.BorderitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorderitemServiceImpl implements BorderitemService {
    private BorderitemDao borderitemDao;

    public BorderitemDao getBorderitemDao() {
        return borderitemDao;
    }

    //使用Spring Bean自动赋值
    @Autowired
    public void setBorderitemDao(BorderitemDao borderitemDao) {
        this.borderitemDao = borderitemDao;
    }

    @Override
    public BorderitemEntity insertOrUpdateBook(BorderitemEntity orderitem) {
        return borderitemDao.save(orderitem);
    }

    @Override
    public void deleteBook(BorderitemEntityPK id) {
        borderitemDao.deleteById(id);
    }

    @Override
    public List<BorderitemEntity> findAllBooks() {
        return borderitemDao.findAll();
    }

    @Override
    public BorderitemEntity findBookById(BorderitemEntityPK id) {
        return borderitemDao.findById(id).orElse(null);
    }
}
