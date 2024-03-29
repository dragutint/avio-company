package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.UserDao;
import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class ClientRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
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
