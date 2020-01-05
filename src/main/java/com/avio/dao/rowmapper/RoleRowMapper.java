package com.avio.dao.rowmapper;

import com.avio.dao.util.AbstractMapper;
import com.avio.domain.administration.Role;

import java.sql.SQLException;

public class RoleRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Role r = new Role();
        r.setId(getInteger("id"));
        r.setName(getString("name"));
        return r;
    }
}
