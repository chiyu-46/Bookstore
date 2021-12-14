package com.chiyu.dao;

import com.chiyu.entity.BorderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorderDao extends JpaRepository<BorderEntity, String> {
    List<BorderEntity> findBorderEntitiesByCid(String cid);
}
