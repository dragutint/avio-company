package com.avio.dao;

import com.avio.dao.rowmapper.PilotRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Pilot;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PilotDao extends AbstractJDBCDao {

    public List<Pilot> find() {
        return jdbcTemplate.query(queries.getSQL("select.pilots"), new PilotRowMapper());
    }

    public Pilot getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.pilot.by.id"), Pilot.class, new PilotRowMapper(), id);
    }
}
