package com.avio.bl.dao;

import com.avio.bl.dao.rowmapper.FlightRowMapper;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.Flight;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.dao.DataAccessException;
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
                    f.getAeroplane().getCapacity(),
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

    public void update(Flight f) {
        jdbcTemplate.update(queries.getSQL("update.flight"),
                new Object[]{
                        f.getPilot().getId(),
                        f.getAeroplane().getId(),
                        f.getAirportDepIata(),
                        f.getAirportArrIata(),
                        f.getGate(),
                        f.getDurationInMin(),
                        f.getTimeDep(),
                        f.getTimeArr(),
                        f.getFreeSeats(),
                        f.getPriceBu(),
                        f.getPriceEc(),
                        f.getId()
                });
    }

    public void unlockFlight(Integer flightId) {
        jdbcTemplate.update(queries.getSQL("unlock.flight"), flightId);
    }

    public void lockFlight(Integer flightId, Integer lockId) {
        jdbcTemplate.update(queries.getSQL("lock.flight"), lockId, flightId);
    }
}
