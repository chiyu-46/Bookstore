package com.chiyu.entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "BOOK", schema = "PUBLIC", catalog = "BOOKSTORE")
public class BookEntity {
    private String bid;
    private String bname;
    private double price;
    private String author;
    private String press;
    private Collection<BorderitemEntity> borderitemsByBid;

    @Id
    @Column(name = "BID", nullable = false, length = 13)
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @Basic
    @Column(name = "BNAME", nullable = false, length = 30)
    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    @Basic
    @Column(name = "PRICE", nullable = false, precision = 0)
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "AUTHOR", nullable = true, length = 30)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "PRESS", nullable = true, length = 30)
    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BookEntity that = (BookEntity) o;
        return Double.compare(that.price, price) == 0 && Objects.equals(bid, that.bid) && Objects.equals(bname, that.bname) && Objects.equals(author, that.author) && Objects.equals(press, that.press);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bid, bname, price, author, press);
    }

    @OneToMany(mappedBy = "bookByBid")
    public Collection<BorderitemEntity> getBorderitemsByBid() {
        return borderitemsByBid;
    }

    public void setBorderitemsByBid(Collection<BorderitemEntity> borderitemsByBid) {
        this.borderitemsByBid = borderitemsByBid;
    }
}
