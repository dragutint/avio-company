package com.avio.dao;

import com.avio.dao.rowmapper.UserRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDao extends AbstractJDBCDao {

    public List<User> find() {
        return jdbcTemplate.query(queries.getSQL("select.users"), new UserRowMapper());
    }

    public User getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.user.by.id"), User.class, new UserRowMapper(), id);
    }
}
