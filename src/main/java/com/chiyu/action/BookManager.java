package com.chiyu.action;

import com.chiyu.entity.BookEntity;
import com.chiyu.service.BookService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
public class BookManager extends ActionSupport {
    //用于获取从页面返回的书籍信息。
    private BookEntity book;
    private List<BookEntity> bookList;
    //用于对书籍进行各种操作的服务层，由Spring Bean赋值
    private BookService bookService;
    //用于使用AJAX技术执行书籍添加删除更新时向网页传递信息
    private InputStream inputStream;

    public BookEntity getBook() {
        return book;
    }

    public void setBook(BookEntity book) {
        this.book = book;
    }

    public List<BookEntity> getBookList() {
        return bookList;
    }

    public void setBookList(List<BookEntity> bookList) {
        this.bookList = bookList;
    }

    public BookService getBookService() {
        return bookService;
    }

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    //访问书籍管理页面，并返回所有书籍信息。
    @Override
    public String execute() throws Exception {
        //返回所有书籍信息
        bookList = bookService.findAllBooks();
        return SUCCESS;
    }

    //添加图书方法，使用AJAX
    public String addOrUpdateBook(){
        bookService.insertOrUpdateBook(book);
        String result = "操作成功";
        inputStream=new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
        return "addOrUpdateBookResult";
    }

    public String deleteBook(){
        bookService.deleteBook(book.getBid());
        String result = "删除成功";
        inputStream=new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
        return "deleteBookResult";
    }
}
