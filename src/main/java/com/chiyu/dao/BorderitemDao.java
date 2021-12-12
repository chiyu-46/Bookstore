package com.chiyu.dao;

import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorderitemDao extends JpaRepository<BorderitemEntity, BorderitemEntityPK> {
    List<BorderitemEntity> findByOid(String oid);
}
