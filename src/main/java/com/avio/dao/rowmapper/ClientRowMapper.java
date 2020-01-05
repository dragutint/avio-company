package com.avio.dao.rowmapper;

import com.avio.dao.UserDao;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.administration.Client;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;

public class ClientRowMapper extends AbstractMapper {
    @Autowired
    private UserDao userDao;

    @Override
    protected Object mapRow() throws SQLException {
        Client c = new Client();
        c.setId(getInteger("id"));
        c.setFirstName(getString("first_name"));
        c.setLastName(getString("last_name"));
        c.setDateOfBirth(getDate("date_of_birth"));
        c.setGender(getString("gender"));
        c.setEmail(getString("email"));
        c.setCountry(getString("country"));
        c.setContact(getString("contact"));
        c.setPassportNum(getLong("passport_num"));
        c.setUser(userDao.getById(getInteger("user_id")));
        return c;
    }
}
