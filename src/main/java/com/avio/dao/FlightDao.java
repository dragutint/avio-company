package com.avio.dao;

import com.avio.dao.rowmapper.FlightRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class FlightDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private FlightRowMapper flightRowMapper;

    public List<Flight> find() {
        return jdbcTemplate.query(queries.getSQL("select.flights"), flightRowMapper);
    }

    public Flight getById(Integer id){
        return (Flight) jdbcTemplate.queryForObject(queries.getSQL("select.flight.by.id"), flightRowMapper, id);
    }

    public void insert(Flight f) {
        jdbcTemplate.update(
            queries.getSQL("insert.flight"),
            new Object[]{
                    f.getPilot().getId(),
                    f.getAeroplane().getId(),
                    f.getAirportDepIata(),
                    f.getAirportArrIata(),
                    f.getGate(),
                    f.getDurationInMin(),
                    f.getTimeDep(),
                    f.getTimeArr(),
                    f.getAeroplane().getCapacityBu(),
                    f.getAeroplane().getCapacityEc(),
                    f.getPriceBu(),
                    f.getPriceEc()
            });
    }

    public List<Flight> find(String query) {
        return jdbcTemplate.query(query, flightRowMapper);
    }

    public String delete(Integer flightId) {
        try {
            jdbcTemplate.update(queries.getSQL("delete.flight"), flightId);
            return "success";
        } catch (DataAccessException e) {
            return e.getMessage();
        }

    }
}
