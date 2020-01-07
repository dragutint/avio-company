package com.avio.dao;

import com.avio.dao.rowmapper.UserRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private UserRowMapper userRowMapper;

    public List<User> find() {
        return jdbcTemplate.query(queries.getSQL("select.users"), userRowMapper);
    }

    public User getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.user.by.id"), User.class, userRowMapper, id);
    }

    public User getByUsername(String username) {
        return (User) jdbcTemplate.queryForObject(queries.getSQL("select.user.by.username"), userRowMapper, username);
    }
}
