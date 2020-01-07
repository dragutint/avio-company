package com.avio.dao.rowmapper;

import com.avio.dao.UserDao;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.administration.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class EmployeeRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
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
