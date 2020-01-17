package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.Role;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class RoleRowMapper extends AbstractMapper {
    @Override
    protected Object mapRow() throws SQLException {
        Role r = new Role();
        r.setId(getInteger("id"));
        r.setName(getString("name"));
        return r;
    }
}
