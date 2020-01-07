package com.avio.dao;

import com.avio.dao.rowmapper.ClassTypeRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.ClassType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ClassTypeDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private ClassTypeRowMapper classTypeRowMapper;

    public List<ClassType> find() {
        return jdbcTemplate.query(queries.getSQL("select.classtypes"), classTypeRowMapper);
    }

    public ClassType getById(Integer id){
        return (ClassType) jdbcTemplate.queryForObject(queries.getSQL("select.classtype.by.id"), classTypeRowMapper, id);
    }
}
