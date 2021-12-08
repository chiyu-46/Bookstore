package com.chiyu.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "BORDER", schema = "PUBLIC", catalog = "BOOKSTORE")
public class BorderEntity {
    private int oid;
    private String ostate;
    private Date otime;
    private String receptor;
    private String address;
    private String phone;
    private CustomerEntity customerByCid;
    private Collection<BorderitemEntity> borderitemsByOid;

    @Id
    @Column(name = "OID", nullable = false)
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
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
    @Column(name = "OTIME", nullable = false)
    public Date getOtime() {
        return otime;
    }

    public void setOtime(Date otime) {
        this.otime = otime;
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
    @Column(name = "PHONE", nullable = true, length = 25)
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
        return oid == that.oid && Objects.equals(ostate, that.ostate) && Objects.equals(otime, that.otime) && Objects.equals(receptor, that.receptor) && Objects.equals(address, that.address) && Objects.equals(phone, that.phone);
    }

    @Override
    public int hashCode() {
        return Objects.hash(oid, ostate, otime, receptor, address, phone);
    }

    @ManyToOne
    @JoinColumn(name = "CID", referencedColumnName = "CID", nullable = false)
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
