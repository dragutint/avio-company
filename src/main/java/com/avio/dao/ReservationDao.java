package com.avio.dao;

import com.avio.dao.rowmapper.ReservationRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ReservationDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private ReservationRowMapper reservationRowMapper;

    public List<Reservation> find() {
        return jdbcTemplate.query(queries.getSQL("select.reservations"), reservationRowMapper);
    }

    public Reservation getById(Integer id){
        return (Reservation) jdbcTemplate.queryForObject(queries.getSQL("select.reservation.by.id"), reservationRowMapper, id);
    }

    public List<Reservation> findByClientUsername(String username) {
        return jdbcTemplate.query(queries.getSQL("select.reservations.by.client.username"), reservationRowMapper, username);
    }
}
