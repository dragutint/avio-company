package com.avio.bl.dao;

import com.avio.bl.dao.rowmapper.PilotRowMapper;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.Pilot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PilotDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private PilotRowMapper pilotRowMapper;

    public List<Pilot> find() {
        return jdbcTemplate.query(queries.getSQL("select.pilots"), pilotRowMapper);
    }

    public Pilot getById(Integer id){
        return (Pilot) jdbcTemplate.queryForObject(queries.getSQL("select.pilot.by.id"), pilotRowMapper, id);
    }
}
