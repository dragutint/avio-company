package com.avio.dao.rowmapper;

import com.avio.dao.ClassTypeDao;
import com.avio.dao.ReservationDao;
import com.avio.dao.util.AbstractMapper;
import com.avio.domain.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

@Component
public class TicketRowMapper extends AbstractMapper {
    @Autowired
    @Lazy
    private ReservationDao reservationDao;
    @Autowired
    @Lazy
    private ClassTypeDao classTypeDao;

    @Override
    protected Object mapRow() throws SQLException {
        Ticket t = new Ticket();
        t.setId(getInteger("id"));
        t.setFirstName(getString("first_name"));
        t.setLastName(getString("last_name"));
        t.setClassType(classTypeDao.getById(getInteger("class_type_id")));
        t.setPassportNum(getLong("passport_num"));
        t.setFlightId(getInteger("flight_id"));
        t.setPrice(getDouble("price"));
        t.setReservation(reservationDao.getById(getInteger("reservation_id")));
        return t;
    }
}
