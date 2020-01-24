package com.avio.bl.service;

import com.avio.bl.dao.FlightDao;
import com.avio.bl.dao.LockingDao;
import com.avio.domain.Flight;
import com.avio.domain.helper.SearchFilterForm;
import com.avio.bl.exception.EmptyResourcesException;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.sun.org.apache.xpath.internal.operations.Bool;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Service
@Log4j2
public class FlightService {

    @Autowired
    private FlightDao flightDao;
    @Autowired
    private CurrencyService currencyService;
    @Autowired
    private LockingDao lockingDao;


    public List<Flight> find() {
        return flightDao.find();
    }

    public void addNewFlight(Flight f){
        flightDao.insert(f);
    }

    public TreeMap<Date, List<Flight>> search(SearchFilterForm searchFilterForm) throws UnirestException {
        List<Flight> list = searchForAllFlights(searchFilterForm);
        if(list == null || list.size() == 0)
            throw new EmptyResourcesException("There is no flights for this criteria");


        if(!searchFilterForm.getCurrency().equals("EUR"))
            convertCurrencies(list, searchFilterForm.getCurrency());
        return createHashMapOfList(list);
    }

    private void convertCurrencies(List<Flight> list, String currency) throws UnirestException {
        for(Flight f : list){
            f.setPriceEc(currencyService.convert("EUR", currency, f.getPriceEc()));
            f.setPriceBu(currencyService.convert("EUR", currency, f.getPriceBu()));
        }
    }

    private TreeMap<Date, List<Flight>> createHashMapOfList(List<Flight> flights){
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

        return sortMap(map);
    }

    private TreeMap<Date, List<Flight>> sortMap(HashMap<Date, List<Flight>> map) {
        Map<Date, List<Flight>> treeMap = new TreeMap<>(map);
        return (TreeMap<Date, List<Flight>>) treeMap;
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

        stringBuilder.append("WHERE f.time_dep >= SYSDATE() AND f.free_seats > 0 AND ");

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

        if(searchFilterForm.getDepartureDate() != null){
            LocalDate localDate = searchFilterForm.getDepartureDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            stringBuilder.append(" AND ");
            stringBuilder.append("DAYOFMONTH(f.time_dep) = " + localDate.getDayOfMonth() +
                    " AND MONTH(f.time_dep) = " + localDate.getMonthValue() +
                    " AND YEAR(f.time_dep) = " + localDate.getYear());
        }

        log.debug("Query generated: {}", stringBuilder.toString());

        return flightDao.find(stringBuilder.toString());
    }

    public Flight getById(Integer flightId) {
        return flightDao.getById(flightId);
    }

    public String delete(Integer flightId) {
        return flightDao.delete(flightId);
    }

    public Boolean locked(Integer flightId, Integer clientId) {
        Integer lockId = lockingDao.getLockByFlightId(flightId);

        if(lockId != null){
            Integer clientIdFromDb = lockingDao.getClientIdByLockId(lockId);
            return clientId != clientIdFromDb;
        } else {
            return lockId != null;
        }

    }

    public void unlockFlight(Integer flightId) {
        Integer lockId = lockingDao.getLockByFlightId(flightId);
        if(lockId != null) {
            lockingDao.endLock(lockId);
            flightDao.unlockFlight(flightId);
        }
    }

    public Integer lockFlight(Integer flightId, Integer clientId) {
        Integer lockId = lockingDao.insert(clientId);

        flightDao.lockFlight(flightId, lockId);

        return lockId;
    }
}
