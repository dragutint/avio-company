package com.avio.dao.rowmapper;

import com.avio.dao.util.AbstractMapper;
import com.avio.domain.ClassType;

import java.sql.SQLException;

public class ClassTypeRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        ClassType ct = new ClassType();
        ct.setId(getInteger("id"));
        ct.setName(getString("name"));
        return ct;
    }
}
