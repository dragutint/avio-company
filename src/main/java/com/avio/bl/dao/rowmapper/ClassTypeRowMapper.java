package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.ClassType;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class ClassTypeRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        ClassType ct = new ClassType();
        ct.setId(getInteger("id"));
        ct.setName(getString("name"));
        return ct;
    }
}
