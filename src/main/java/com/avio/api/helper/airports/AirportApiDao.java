package com.avio.api.helper.airports;

import com.avio.dao.util.AbstractJDBCDao;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AirportApiDao extends AbstractJDBCDao {

    public List<AirportApiClass> findAll() {
        return jdbcTemplate.query("SELECT * FROM airportsdb.airport", new AirportApiRowMapper());
    }

    public List<AirportApiClass> findByTerm(String term) {
        return jdbcTemplate.query(queries.getSQL("api.airport.select.term"), new AirportApiRowMapper(), "%" + term + "%", "%" + term + "%");
    }

    public List<AirportApiClass> findByIATA(String term) {
        return jdbcTemplate.query(queries.getSQL("api.airport.select.iata"), new AirportApiRowMapper(), term);
    }
}
