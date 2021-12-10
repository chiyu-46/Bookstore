package com.chiyu.service.Impl;

import com.chiyu.dao.BookDao;
import com.chiyu.entity.BookEntity;
import com.chiyu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    public BookDao getBookDao() {
        return bookDao;
    }

    //使用Spring Bean自动赋值
    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public BookEntity insertOrUpdateBook(BookEntity book) {
        return bookDao.save(book);
    }

    @Override
    public void deleteBook(String id) {
        bookDao.deleteById(id);
    }

    @Override
    public List<BookEntity> findAllBooks() {
        return bookDao.findAll();
    }

    @Override
    public BookEntity findBookById(String id) {
        return bookDao.findById(id).orElse(null);

    }
}
