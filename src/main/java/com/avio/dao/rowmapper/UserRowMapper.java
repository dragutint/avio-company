package com.avio.dao.rowmapper;

import com.avio.dao.RoleDao;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.administration.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;

public class UserRowMapper extends AbstractMapper {
    @Autowired
    private RoleDao roleDao;

    @Override
    protected Object mapRow() throws SQLException {
        User u = new User();
        u.setId(getInteger("id"));
        u.setUsername(getString("username"));
        u.setPassword(getString("password"));
        u.setRole(roleDao.getById(getInteger("id")));
        return u;
    }
}
