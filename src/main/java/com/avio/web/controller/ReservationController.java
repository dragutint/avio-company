package com.avio.web.controller;

import com.avio.domain.Flight;
import com.avio.domain.Reservation;
import com.avio.domain.Ticket;
import com.avio.domain.Client;
import com.avio.bl.exception.EmptyResourcesException;
import com.avio.bl.service.*;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Log4j2
@RequestMapping("/reserve")
@SessionAttributes({"reservation"})
public class ReservationController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private ClassTypeService classTypeService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private TicketService ticketService;


    @GetMapping("/{flightId}")
    @PreAuthorize("hasAnyAuthority('client')")
    public String reserve(Model model, @PathVariable Integer flightId){
        String username = LoginController.getPrincipal();

        Reservation reservation = new Reservation();
        Client c = clientService.getByUsername(username);
        Flight f = flightService.getById(flightId);
        reservation.setFlight(f);
        reservation.setClient(c);

        log.debug("Creating reservation for client: {}", c.getUser().getUsername());

        model.addAttribute("flight", f);
        model.addAttribute("reservation", reservation);

        return "reserve/reserve";
    }

    @PostMapping("/passengers-info")
    @PreAuthorize("hasAnyAuthority('admin', 'client')")
    public String reservePassengersInfo(Model model, @ModelAttribute Reservation reservation){
        if(!(reservation.getPassengersNum() != null && reservation.getPassengersNum() > 0))
            throw new EmptyResourcesException("You have not entered passengers num or you entered negative number");

        reservationService.reserve(reservation);
        model.addAttribute("reservation", reservation);
        model.addAttribute("classtypes", classTypeService.find());

        return "reserve/passengers-info";
    }

    @GetMapping("/preview/{reservationId}")
    public String previewReservation(@PathVariable Integer reservationId, Model model){
        Reservation r = reservationService.getById(reservationId);
        List<Ticket> tickets = ticketService.findTicketsByReservationId(reservationId);

        model.addAttribute("reservation", r);
        model.addAttribute("tickets", tickets);

        return "reserve/preview";
    }

    @ModelAttribute("reservation")
    public Reservation getReservation() {
        return new Reservation();
    }
}
