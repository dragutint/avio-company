package com.avio.web.controller;

import com.avio.bl.job.FlightLockJob;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private FlightLockJob flightLockJob;


    @GetMapping("/{flightId}")
    @PreAuthorize("hasAnyAuthority('client')")
    public String reserve(Model model, @PathVariable Integer flightId) throws InterruptedException {
        String username = LoginController.getPrincipal();
        Client c = clientService.getByUsername(username);

        if(flightService.locked(flightId, c.getId())){
            log.error("Error: flight is locked");
            model.addAttribute("exception", new Exception("Flight is locked"));
            return "error";
        }


        Reservation reservation = new Reservation();
        Flight f = flightService.getById(flightId);
        reservation.setFlight(f);
        reservation.setClient(c);

        log.debug("Creating reservation for client: {}", c.getUser().getUsername());

        model.addAttribute("flight", f);
        model.addAttribute("reservation", reservation);

        Integer lockId = flightService.lockFlight(flightId, c.getId());
        flightLockJob.unlockFlightAfterDelay(flightId, lockId);

        return "reserve/reserve";
    }

    @PostMapping("/passengers-info")
    @PreAuthorize("hasAnyAuthority('client')")
    public String reservePassengersInfo(Model model, @ModelAttribute Reservation reservation){
        reservationService.checkReservation(reservation);
        flightService.unlockFlight(reservation.getFlight().getId());
        reservationService.reserve(reservation);

        model.addAttribute("reservation", reservation);
        model.addAttribute("classtypes", classTypeService.find());

        return "reserve/passengers-info";
    }

    @GetMapping("/passengers-info/{reservationId}")
    @PreAuthorize("hasAnyAuthority('client')")
    public String reservePassengersInfoContinue(Model model, @PathVariable Integer reservationId){
        Reservation reservation = reservationService.getById(reservationId);

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

    @ExceptionHandler(EmptyResourcesException.class)
    public ModelAndView handleError(HttpServletRequest req, EmptyResourcesException ex) {
        log.error("Error: {}", ex.getMessage());

        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", ex);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("error");
        return mav;
    }

    @ModelAttribute("reservation")
    public Reservation getReservation() {
        return new Reservation();
    }
}
