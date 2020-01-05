package com.avio.dao;

import com.avio.dao.rowmapper.ReservationRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Reservation;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ReservationDao extends AbstractJDBCDao {

    public List<Reservation> find() {
        return jdbcTemplate.query(queries.getSQL("select.reservations"), new ReservationRowMapper());
    }

    public Reservation getById(Integer id){
        return jdbcTemplate.queryForObject(queries.getSQL("select.reservation.by.id"), Reservation.class, new ReservationRowMapper(), id);
    }
}
