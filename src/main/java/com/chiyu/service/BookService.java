package com.chiyu.service;

import com.chiyu.entity.BookEntity;

import java.util.List;

public interface BookService {
    //插入一条图书信息
    BookEntity insertBook(BookEntity book);

    //删除一条图书信息
    void deleteBook(String id);

    //更新一条图书信息
    BookEntity updateBook(BookEntity book);

    //获取所有图书信息
    List<BookEntity> findAllBooks();

    //寻找指定书号的图书信息
    BookEntity findBookById(String id);
}
