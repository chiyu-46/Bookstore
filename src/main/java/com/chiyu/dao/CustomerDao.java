package com.chiyu.dao;

import com.chiyu.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerDao extends JpaRepository<CustomerEntity, String> {
    List<CustomerEntity> findByCnameAndPassword(String cname, String password);
}
