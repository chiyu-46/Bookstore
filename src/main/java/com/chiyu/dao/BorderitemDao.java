package com.chiyu.dao;

import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BorderitemDao extends JpaRepository<BorderitemEntity, BorderitemEntityPK> {
}
