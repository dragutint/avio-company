package com.avio.bl.dao.rowmapper;

import com.avio.bl.dao.ClientDao;
import com.avio.bl.dao.FlightDao;
import com.avio.bl.dao.util.AbstractMapper;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class ReservationRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
    private FlightDao flightDao;
    @Autowired
    @Lazy
    private ClientDao clientDao;

    @Override
    protected Object mapRow() throws SQLException {
        Reservation r = new Reservation();
        r.setId(getInteger("id"));
        r.setClient(clientDao.getById(getInteger("client_id")));
        r.setFlight(flightDao.getById(getInteger("flight_id")));
        r.setDateCreated(getDate("date_created"));
        r.setPassengersNum(getInteger("passengers_num"));
        r.setPayed(getBoolean("payed"));
        r.setPrice(getDouble("price"));
        return r;
    }
}
