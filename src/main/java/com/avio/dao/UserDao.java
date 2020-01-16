package com.avio.dao;

import com.avio.dao.rowmapper.UserRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
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
        return (User) jdbcTemplate.queryForObject(queries.getSQL("select.user.by.id"), userRowMapper, id);
    }

    public User getByUsername(String username) {
        return (User) jdbcTemplate.queryForObject(queries.getSQL("select.user.by.username"), userRowMapper, username);
    }

    public void insert(User user) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection
                    .prepareStatement(queries.getSQL("insert.user"));
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getRole().getId());
            return ps;
        }, keyHolder);
        user.setId(keyHolder.getKey().intValue());
    }
}
