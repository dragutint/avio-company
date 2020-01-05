package com.avio.dao;

import com.avio.dao.rowmapper.RoleRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.administration.Role;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class RoleDao extends AbstractJDBCDao {

    public List<Role> find() {
        return jdbcTemplate.query(queries.getSQL("select.roles"), new RoleRowMapper());
    }

    public Role getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.role.by.id"), Role.class, new RoleRowMapper(), id);
    }
}
