package com.avio.dao;

import com.avio.dao.rowmapper.FlightRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Flight;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class FlightDao extends AbstractJDBCDao {

    public List<Flight> find() {
        return jdbcTemplate.query(queries.getSQL("select.flights"), new FlightRowMapper());
    }

    public Flight getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.flight.by.id"), Flight.class, new FlightRowMapper(), id);
    }
}
