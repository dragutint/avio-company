package com.avio.dao;

import com.avio.dao.rowmapper.TicketRowMapper;
import com.avio.dao.util.AbstractJDBCDao;
import com.avio.domain.Flight;
import com.avio.domain.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class TicketDao extends AbstractJDBCDao {
    @Autowired
    @Lazy
    private TicketRowMapper ticketRowMapper;

    public List<Flight> find() {
        return jdbcTemplate.query(queries.getSQL("select.tickets"), ticketRowMapper);
    }

    public void insert(Ticket t) {
        jdbcTemplate.update(
            queries.getSQL("insert.ticket"),
            new Object[]{
                    t.getFirstName(),
                    t.getLastName(),
                    t.getPassportNum(),
                    t.getPrice(),
                    t.getReservation().getId(),
                    t.getFlightId(),
                    t.getClassType().getId()
            });
    }

    public List<Ticket> findTicketsByReservationId(Integer reservationId) {
        return jdbcTemplate.query(queries.getSQL("select.tickets.by.reservation"), ticketRowMapper, reservationId);
    }
}
