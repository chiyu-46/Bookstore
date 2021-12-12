package com.chiyu.action.foreground;

import com.chiyu.entity.BookEntity;
import com.chiyu.service.BookService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class IndexForCustomer extends ActionSupport {
    //用于获取从页面返回的书籍信息。
    private List<BookEntity> bookList;
    //用于对书籍进行各种操作的服务层，由Spring Bean赋值
    private BookService bookService;

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

    //直接访问网站主页时，将转到调度器进行身份验证。
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    //访问前台首页，并返回所有书籍信息。
    public String toIndex(){
        //返回所有书籍信息
        bookList = bookService.findAllBooks();
        return "toIndex";
    }
}
