package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.RoleDao;
import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class UserRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
    private RoleDao roleDao;

    @Override
    protected Object mapRow() throws SQLException {
        User u = new User();
        u.setId(getInteger("id"));
        u.setUsername(getString("username"));
        u.setPassword(getString("password"));
        u.setRole(roleDao.getById(getInteger("role_id")));
        return u;
    }
}
