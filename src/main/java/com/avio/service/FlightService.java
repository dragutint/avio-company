package com.avio.service;

import com.avio.dao.FlightDao;
import com.avio.domain.Flight;
import com.avio.domain.helper.SearchFilterForm;
import com.avio.exception.EmptyResourcesException;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
public class FlightService {

    @Autowired
    private FlightDao flightDao;

    public List<Flight> find() {
        return flightDao.find();
    }

    public void addNewFlight(Flight f){
        // TODO all validations, bl etc @Milica Nikolic

        flightDao.insert(f);
    }

    public List<Flight> search(SearchFilterForm searchFilterForm) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SELECT * FROM aviodb.flight f ");

        stringBuilder.append("WHERE ");

        if(searchFilterForm.getFromIata() == null){
            throw new EmptyResourcesException("You have not entered departure airport");
        } else {
            stringBuilder.append("f.airport_dep_iata = ");
            stringBuilder.append("'" + searchFilterForm.getFromIata() + "'");
        }

        stringBuilder.append(" AND ");

        if(searchFilterForm.getToIata() == null){
            throw new EmptyResourcesException("You have not entered arrival airport");
        } else {
            stringBuilder.append("f.airport_arr_iata = ");
            stringBuilder.append("'" + searchFilterForm.getToIata() + "'");
        }

        log.debug("Query generated: {}", stringBuilder.toString());

        return flightDao.find(stringBuilder.toString());
    }
}
