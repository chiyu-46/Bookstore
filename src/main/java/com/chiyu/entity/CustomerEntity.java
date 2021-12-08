package com.chiyu.entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "CUSTOMER", schema = "PUBLIC", catalog = "BOOKSTORE")
public class CustomerEntity {
    private String cid;
    private String cname;
    private String phone;
    private String address;
    private String password;
    private Collection<BorderEntity> bordersByCid;

    @Id
    @Column(name = "CID", nullable = false, length = 10)
    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    @Basic
    @Column(name = "CNAME", nullable = false, length = 20)
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Basic
    @Column(name = "PHONE", nullable = true, length = 20)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "ADDRESS", nullable = true, length = 60)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "PASSWORD", nullable = false, length = 20)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomerEntity that = (CustomerEntity) o;
        return Objects.equals(cid, that.cid) && Objects.equals(cname, that.cname) && Objects.equals(phone, that.phone) && Objects.equals(address, that.address) && Objects.equals(password, that.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cid, cname, phone, address, password);
    }

    @OneToMany(mappedBy = "customerByCid")
    public Collection<BorderEntity> getBordersByCid() {
        return bordersByCid;
    }

    public void setBordersByCid(Collection<BorderEntity> bordersByCid) {
        this.bordersByCid = bordersByCid;
    }
}
