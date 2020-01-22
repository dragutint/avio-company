package com.avio.bl.dao;

import com.avio.bl.dao.rowmapper.ReservationRowMapper;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
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

    public void insert(Reservation reservation) {
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection
                    .prepareStatement(queries.getSQL("insert.reservation"));
            ps.setInt(1, reservation.getClient().getId());
            ps.setInt(2, reservation.getFlight().getId());
            ps.setInt(3, reservation.getPassengersNum());
            return ps;
        }, keyHolder);
        reservation.setId(keyHolder.getKey().intValue());
    }

    public void updatePrice(Reservation r) {
        jdbcTemplate.update(queries.getSQL("update.price"), new Object[]{r.getPrice(), r.getId()});
    }

    public List<Reservation> findByFlightId(Integer flightId) {
        return jdbcTemplate.query(queries.getSQL("select.reservations.by.flight"), reservationRowMapper, flightId);
    }
}
