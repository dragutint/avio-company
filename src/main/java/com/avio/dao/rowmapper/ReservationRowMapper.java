package com.avio.dao.rowmapper;

import com.avio.dao.*;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;

public class ReservationRowMapper extends AbstractMapper {
    @Autowired
    private FlightDao flightDao;
    @Autowired
    private ClientDao clientDao;

    @Override
    protected Object mapRow() throws SQLException {
        Reservation r = new Reservation();
        r.setId(getInteger("id"));
        r.setClient(clientDao.getById(getInteger("client_id")));
        r.setFlightFrom(flightDao.getById(getInteger("flight_from_id")));
        r.setFlightTo(flightDao.getById(getInteger("flight_to_id")));
        r.setDateCreated(getDate("date_created"));
        r.setPassengersNum(getInteger("passengers_num"));
        r.setPayed(getBoolean("payed"));
        r.setRoundTrip(getBoolean("round_trip"));
        r.setPrice(getDouble("price"));
        return r;
    }
}
