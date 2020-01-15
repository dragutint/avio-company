package com.avio.controller;

import com.avio.binders.AeroplaneBinder;
import com.avio.binders.PilotBinder;
import com.avio.domain.Aeroplane;
import com.avio.domain.Flight;
import com.avio.domain.Pilot;
import com.avio.exception.EmptyResourcesException;
import com.avio.service.AeroplaneService;
import com.avio.service.FlightService;
import com.avio.service.PilotService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@Log4j2
public class FlightController {
    @Autowired
    private PilotBinder pilotBinder;
    @Autowired
    private AeroplaneBinder aeroplaneBinder;
    @Autowired
    private PilotService pilotService;
    @Autowired
    private AeroplaneService aeroplaneService;
    @Autowired
    private FlightService flightService;

    @RequestMapping("/flights")
    public String flights(ModelMap model){
        List<Flight> flights = flightService.find();
        model.addAttribute("flights", flights);
        return "flight/flights";
    }

    @RequestMapping("/new-flight")
    public String newFlight(ModelMap model){
        List<Pilot> pilots = pilotService.find();
        List<Aeroplane> aeroplanes = aeroplaneService.find();

        if(pilots == null || pilots.size() == 0)
            throw new EmptyResourcesException("You dont have pilots for your flight.");
        if(aeroplanes == null || aeroplanes.size() == 0)
            throw new EmptyResourcesException("You dont have aeroplanes for your flight.");

        model.addAttribute("pilots", pilots);
        model.addAttribute("aeroplanes", aeroplaneService.find());
        model.addAttribute("flight", new Flight());

        return "flight/flight-form";
    }

    @PostMapping("/addFlight")
    public String addFlight(ModelMap model, @ModelAttribute Flight flight){
        log.debug("Adding new flight: {}", flight);

        flightService.addNewFlight(flight);
        return "redirect:/search";
    }

    @ExceptionHandler(EmptyResourcesException.class)
    public ModelAndView handleError(HttpServletRequest req, EmptyResourcesException ex) {
        log.error("Error: {}", ex.getMessage());

        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", ex);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("error");
        return mav;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Pilot.class, this.pilotBinder);
        binder.registerCustomEditor(Aeroplane.class, this.aeroplaneBinder);
    }
}
