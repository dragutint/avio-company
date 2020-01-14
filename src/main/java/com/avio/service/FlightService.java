package com.avio.service;

import com.avio.dao.FlightDao;
import com.avio.domain.Flight;
import com.avio.domain.helper.SearchFilterForm;
import com.avio.exception.EmptyResourcesException;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

    public HashMap<Date, List<Flight>> search(SearchFilterForm searchFilterForm) {
        return createHashMapOfList(searchForAllFlights(searchFilterForm));
    }

    private HashMap<Date, List<Flight>> createHashMapOfList(List<Flight> flights){
        HashMap<Date, List<Flight>> map = new HashMap<>();
        List<Date> entered = new ArrayList<>();
        List<Flight> term = new ArrayList<>();

        for (int i = 0; i < flights.size(); i++) {
            if(!entered.contains(parseDateWithoutTime(flights.get(i).getTimeDep()))){
                entered.add(parseDateWithoutTime(flights.get(i).getTimeDep()));
                term.add(flights.get(i));

                for(int j = i + 1; j < flights.size(); j++){
                    Flight fi = flights.get(i);
                    Flight fj = flights.get(j);
                    if(fi.getTimeDep().getYear() == fj.getTimeDep().getYear() && fi.getTimeDep().getMonth() == fj.getTimeDep().getMonth() && fi.getTimeDep().getDay() == fj.getTimeDep().getDay()){
                        term.add(flights.get(j));
                    }
                }

                if(term.size() != 0){
                    map.put(parseDateWithoutTime(flights.get(i).getTimeDep()), term);
                    term = new ArrayList<>();
                }
            }
        }
        return map;
    }

    private Date parseDateWithoutTime(Date d){
        Date newDate = new Date(d.getTime());
        newDate.setHours(0);
        newDate.setMinutes(0);
        newDate.setSeconds(0);
        return newDate;
    }

    private List<Flight> searchForAllFlights(SearchFilterForm searchFilterForm) {
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
