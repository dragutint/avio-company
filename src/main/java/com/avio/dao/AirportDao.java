package com.avio.dao;

import com.avio.dao.rowmapper.AirportRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Airport;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AirportDao extends AbstractJDBCDao {

    public List<Airport> find() {
        return jdbcTemplate.query(queries.getSQL("select.airports"), new AirportRowMapper());
    }

    public Airport getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.airport.by.id"), Airport.class, new AirportRowMapper(), id);
    }
}
