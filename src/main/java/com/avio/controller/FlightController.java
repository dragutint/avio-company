package com.avio.controller;

import com.avio.domain.Aeroplane;
import com.avio.domain.Flight;
import com.avio.service.AeroplaneService;
import com.avio.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class FlightController {

    @Autowired
    private FlightService flightService;

    @RequestMapping("/flights")
    public String flights(ModelMap model){
        List<Flight> flights = flightService.find();
        model.addAttribute("flights", flights);
        return "flight/flights";
    }
}
