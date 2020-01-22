package com.avio.bl.dao;

import com.avio.bl.dao.rowmapper.FlightChangeRowMapper;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.helper.FlightChange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class FlightLookupDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private FlightChangeRowMapper flightChangeRowMapper;

    public List<FlightChange> findNew(Date date) {
        return jdbcTemplate.query(queries.getSQL("select.new.flight.changes"), flightChangeRowMapper, date);
    }

    public void processFlightChange(Integer id) {
        jdbcTemplate.update(queries.getSQL("process.flight.change"), id);
    }
}
