package com.avio.dao.rowmapper;

import com.avio.dao.UserDao;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.administration.Employee;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;

public class EmployeeRowMapper extends AbstractMapper {
    @Autowired
    private UserDao userDao;

    @Override
    protected Object mapRow() throws SQLException {
        Employee e = new Employee();
        e.setId(getInteger("id"));
        e.setFirstName(getString("first_name"));
        e.setLastName(getString("last_name"));
        e.setEmail(getString("email"));
        e.setUser(userDao.getById(getInteger("user_id")));
        return e;
    }
}
