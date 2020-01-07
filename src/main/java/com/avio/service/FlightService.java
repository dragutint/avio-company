package com.avio.service;

import com.avio.dao.AeroplaneDao;
import com.avio.dao.FlightDao;
import com.avio.domain.Aeroplane;
import com.avio.domain.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightService {

    @Autowired
    private FlightDao flightDao;

    public List<Flight> find() {
        return flightDao.find();
    }
}
