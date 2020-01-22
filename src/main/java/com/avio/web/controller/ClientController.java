package com.avio.web.controller;

import com.avio.bl.exception.EmptyResourcesException;
import com.avio.bl.service.ClientService;
import com.avio.bl.service.EmployeeService;
import com.avio.bl.service.ReservationService;
import com.avio.bl.service.UserService;
import com.avio.domain.Client;
import com.avio.domain.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
public class ClientController {
    @Autowired
    private ClientService clientService;
    @Autowired
    private ReservationService reservationService;

    @RequestMapping("/clients")
    public String showClients(Model model, HttpSession session){
        model.addAttribute("clients", clientService.findAll());
        return "client/list";
    }

    @RequestMapping("/client/profile/{clientId}")
    public String showClientProfile(Model model, @PathVariable Integer clientId){
        Client client = clientService.getById(clientId);
        model.addAttribute("client", client);
        model.addAttribute("reservations", reservationService.findByClientUsername(client.getUser().getUsername()));

        return "profile/client";
    }

}
