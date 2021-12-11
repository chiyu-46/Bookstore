package com.chiyu.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class BorderitemEntityPK implements Serializable {
    private String oid;
    private String bid;

    @Column(name = "OID", nullable = false, length = 32)
    @Id
    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @Column(name = "BID", nullable = false, length = 13)
    @Id
    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BorderitemEntityPK that = (BorderitemEntityPK) o;
        return Objects.equals(oid, that.oid) && Objects.equals(bid, that.bid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(oid, bid);
    }
}
