package com.avio.controller;

import com.avio.domain.Reservation;
import com.avio.domain.Ticket;
import com.avio.domain.helper.PassengerInfo;
import com.avio.domain.helper.TicketDTO;
import com.avio.service.ClassTypeService;
import com.avio.service.ReservationService;
import com.avio.service.TicketService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/tickets")
public class TicketRestController {
    @Autowired
    private ClassTypeService classTypeService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private TicketService ticketService;

    @ResponseBody
    @PostMapping("/passengers-info")
    public Integer createTickets(@RequestBody TicketDTO dto){
        log.debug("Reservation ID: {}, Passenger list retrieved for creating tickets: {}", dto.getReservationID(), dto.getList());
        Reservation r = reservationService.getById(Math.toIntExact(dto.getReservationID()));
        generatePrice(dto, r);
        reservationService.updatePrice(r);
        List<Ticket> tickets = getTicketsFromDTO(dto, r);

        for(Ticket t : tickets) {
            ticketService.save(t);
        }

        return r.getId();
    }

    private void generatePrice(TicketDTO dto, Reservation r) {
        Double price = Double.valueOf(0);
        for(PassengerInfo pi : dto.getList()){
            price += pi.getPrice() != null ? pi.getPrice() : 0;
        }
        r.setPrice(price);
    }

    private List<Ticket> getTicketsFromDTO(TicketDTO dto, Reservation r) {
        List<Ticket> list = new ArrayList<>();

        for(PassengerInfo pi : dto.getList()){
            Ticket t = new Ticket();
            t.setReservation(r);
            t.setFirstName(pi.getFirstName());
            t.setLastName(pi.getLastName());
            t.setPrice(pi.getPrice());
            t.setPassportNum(pi.getPassport());
            t.setClassType(classTypeService.getById(pi.getClassType()));
            list.add(t);
        }
        return list;
    }

}