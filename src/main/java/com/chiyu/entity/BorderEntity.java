package com.chiyu.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "BORDER", schema = "PUBLIC", catalog = "BOOKSTORE")
public class BorderEntity {
    private String oid;
    private String cid;
    private Timestamp otime;
    private String ostate;
    private String receptor;
    private String address;
    private String phone;
    private CustomerEntity customerByCid;
    private Collection<BorderitemEntity> borderitemsByOid;

    @Id
    @Column(name = "OID", nullable = false, length = 32)
    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @Basic
    @Column(name = "CID", nullable = false, length = 32)
    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    @Basic
    @Column(name = "OTIME", nullable = false)
    public Timestamp getOtime() {
        return otime;
    }

    public void setOtime(Timestamp otime) {
        this.otime = otime;
    }

    @Basic
    @Column(name = "OSTATE", nullable = false, length = 6)
    public String getOstate() {
        return ostate;
    }

    public void setOstate(String ostate) {
        this.ostate = ostate;
    }

    @Basic
    @Column(name = "RECEPTOR", nullable = false, length = 20)
    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    @Basic
    @Column(name = "ADDRESS", nullable = false, length = 60)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "PHONE", nullable = false, length = 20)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BorderEntity that = (BorderEntity) o;
        return Objects.equals(oid, that.oid) && Objects.equals(cid, that.cid) && Objects.equals(otime, that.otime) && Objects.equals(ostate, that.ostate) && Objects.equals(receptor, that.receptor) && Objects.equals(address, that.address) && Objects.equals(phone, that.phone);
    }

    @Override
    public int hashCode() {
        return Objects.hash(oid, cid, otime, ostate, receptor, address, phone);
    }

    @ManyToOne
    @JoinColumn(name = "CID", referencedColumnName = "CID", nullable = false,insertable = false,updatable = false)
    public CustomerEntity getCustomerByCid() {
        return customerByCid;
    }

    public void setCustomerByCid(CustomerEntity customerByCid) {
        this.customerByCid = customerByCid;
    }

    @OneToMany(mappedBy = "borderByOid")
    public Collection<BorderitemEntity> getBorderitemsByOid() {
        return borderitemsByOid;
    }

    public void setBorderitemsByOid(Collection<BorderitemEntity> borderitemsByOid) {
        this.borderitemsByOid = borderitemsByOid;
    }
}
