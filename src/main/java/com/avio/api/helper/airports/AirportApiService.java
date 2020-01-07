package com.avio.api.helper.airports;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AirportApiService {

    @Autowired
    private AirportApiDao airportApiDao;

    public List<AirportApiClass> findAll() {
        return airportApiDao.findAll();
    }

    public List<AirportApiClass> findByTerm(String term) {
        if(term.length() < 2){
            throw new RuntimeException("Text length is too small");
        } else {
            return airportApiDao.findByTerm(term);
        }
    }

    public List<AirportApiClass> findByIATA(String term) {
        return airportApiDao.findByIATA(term);
    }
}
