package com.avio.dao;

import com.avio.dao.rowmapper.AirportRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Airport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AirportDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private AirportRowMapper airportRowMapper;

    public List<Airport> find() {
        return jdbcTemplate.query(queries.getSQL("select.airports"), airportRowMapper);
    }

    public Airport getById(Integer id){
        return (Airport) jdbcTemplate.queryForObject(queries.getSQL("select.airport.by.id"), airportRowMapper, id);
    }
}
