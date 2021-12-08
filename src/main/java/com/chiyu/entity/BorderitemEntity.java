package com.chiyu.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "BORDERITEM", schema = "PUBLIC", catalog = "BOOKSTORE")
@IdClass(BorderitemEntityPK.class)
public class BorderitemEntity {
    private int oid;
    private String bid;
    private int quantity;
    private BorderEntity borderByOid;
    private BookEntity bookByBid;

    @Id
    @Column(name = "OID", nullable = false)
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    @Id
    @Column(name = "BID", nullable = false, length = 13)
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @Basic
    @Column(name = "QUANTITY", nullable = false)
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BorderitemEntity that = (BorderitemEntity) o;
        return oid == that.oid && quantity == that.quantity && Objects.equals(bid, that.bid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(oid, bid, quantity);
    }

    @ManyToOne
    @JoinColumn(name = "OID", referencedColumnName = "OID", nullable = false,insertable = false,updatable = false)
    public BorderEntity getBorderByOid() {
        return borderByOid;
    }

    public void setBorderByOid(BorderEntity borderByOid) {
        this.borderByOid = borderByOid;
    }

    @ManyToOne
    @JoinColumn(name = "BID", referencedColumnName = "BID", nullable = false,insertable = false,updatable = false)
    public BookEntity getBookByBid() {
        return bookByBid;
    }

    public void setBookByBid(BookEntity bookByBid) {
        this.bookByBid = bookByBid;
    }
}
