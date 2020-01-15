package com.avio.controller;

import com.avio.domain.Flight;
import com.avio.domain.Reservation;
import com.avio.domain.administration.Client;
import com.avio.service.ClientService;
import com.avio.service.FlightService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j2
@RequestMapping("/reserve")
public class ReservationController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private ClientService clientService;

    @GetMapping("/{flightId}")
    @PreAuthorize("hasAnyAuthority('admin', 'client')")
    public String reservation(Model model, @PathVariable Integer flightId){
        String username = LoginController.getPrincipal();

        Reservation reservation = new Reservation();
        Client c = clientService.getByUsername(username);
        Flight f = flightService.getById(flightId);
        model.addAttribute("flight", f);
        model.addAttribute("client", c);
        model.addAttribute("reservation", reservation);

        return "reserve/reserve";
    }
}
