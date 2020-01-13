package com.avio.dao;

import com.avio.dao.rowmapper.AeroplaneRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Aeroplane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AeroplaneDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private AeroplaneRowMapper aeroplaneRowMapper;

    public List<Aeroplane> find() {
        return jdbcTemplate.query(queries.getSQL("select.aeroplanes"), aeroplaneRowMapper);
    }

    public Aeroplane getById(Integer id){
        return (Aeroplane) jdbcTemplate.queryForObject(queries.getSQL("select.aeroplane.by.id"), aeroplaneRowMapper, id);
    }
}
