package com.avio.dao;

import com.avio.dao.rowmapper.ClassTypeRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.ClassType;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ClassTypeDao extends AbstractJDBCDao {

    public List<ClassType> find() {
        return jdbcTemplate.query(queries.getSQL("select.classtypes"), new ClassTypeRowMapper());
    }

    public ClassType getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.classtype.by.id"), ClassType.class, new ClassTypeRowMapper(), id);
    }
}
