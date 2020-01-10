package com.avio.controller;

import com.avio.domain.Flight;
import com.avio.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class FlightController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/search")
    public String search() {

        return "search/search";
    }

    @GetMapping("/searchFlights")
    public String searchResults(@RequestParam String airportFrom) {
//        TODO implementation
        System.out.println(airportFrom);

        return "search/search-results";
    }

    @RequestMapping("/flights")
    public String flights(ModelMap model){
        List<Flight> flights = flightService.find();
        model.addAttribute("flights", flights);
        return "flight/flights";
    }
}
