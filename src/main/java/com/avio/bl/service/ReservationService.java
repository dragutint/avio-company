package com.avio.bl.service;

import com.avio.bl.dao.FlightDao;
import com.avio.bl.dao.ReservationDao;
import com.avio.domain.Flight;
import com.avio.domain.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

    @Autowired
    private ReservationDao reservationDao;
    @Autowired
    private FlightDao flightDao;

    public List<Reservation> find() {
        return reservationDao.find();
    }

    public List<Reservation> findByClientUsername(String username){
        return reservationDao.findByClientUsername(username);
    }

    public void reserve(Reservation reservation) {
        reservationDao.insert(reservation);

        Flight flight = reservation.getFlight();
        flight.setFreeSeats(flight.getFreeSeats() - reservation.getPassengersNum());

        flightDao.update(flight);
    }

    public Reservation getById(Integer reservationID) {
        return reservationDao.getById(reservationID);
    }

    public void updatePrice(Reservation r) {
        reservationDao.updatePrice(r);
    }
}
