package com.avio.dao;

import com.avio.dao.rowmapper.AeroplaneRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Aeroplane;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AeroplaneDao extends AbstractJDBCDao {

    public List<Aeroplane> find() {
        return jdbcTemplate.query(queries.getSQL("select.aeroplanes"), new AeroplaneRowMapper());
    }

    public Aeroplane getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.pilot.by.id"), Aeroplane.class, new AeroplaneRowMapper(), id);
    }
}
