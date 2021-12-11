package com.chiyu.dao;

import com.chiyu.entity.BorderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BorderDao extends JpaRepository<BorderEntity, String> {
}
