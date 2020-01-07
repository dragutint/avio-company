package com.avio.api.helper.airports;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/airports")
public class AirportsApiController {
    @Autowired
    @Lazy
    private AirportApiService airportApiService;

    @RequestMapping("/all")
    @ResponseBody
    public List<AirportApiClass> airports(){
        return airportApiService.findAll();
    }

    @RequestMapping("/{term}")
    @ResponseBody
    public List<AirportApiClass> airportsByTerm(@PathVariable String term){
        return airportApiService.findByTerm(term);
    }

    @RequestMapping("/iata/{term}")
    @ResponseBody
    public List<AirportApiClass> airportsByIATA(@PathVariable String term){
        return airportApiService.findByIATA(term);
    }
}
