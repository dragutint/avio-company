package com.avio.web.controller;

import com.avio.domain.User;
import com.avio.bl.exception.EmptyResourcesException;
import com.avio.bl.service.ClientService;
import com.avio.bl.service.EmployeeService;
import com.avio.bl.service.ReservationService;
import com.avio.bl.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
public class ProfileController {
    @Autowired
    private UserService userService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ClientService clientService;
    @Autowired
    private ReservationService reservationService;

    @RequestMapping("/profile")
    public String showProfile(Model model, HttpSession session){
        String username = LoginController.getPrincipal();

        if(session.getAttribute("user") == null){
            session.setAttribute("user", username);
        }

        User user = userService.getByUsername(username);

        if(user == null) {
            log.error("User doesnt exists, username: {}", username);
            throw new EmptyResourcesException("User doesnt exists");
        }

        switch (user.getRole().getId()){
            case 1:
                model.addAttribute("employee", employeeService.getByUsername(user.getUsername()));
                return "profile/employee";
            case 2:
                model.addAttribute("client", clientService.getByUsername(user.getUsername()));
                model.addAttribute("reservations", reservationService.findByClientUsername(user.getUsername()));
                return "profile/client";
            default:
                throw new RuntimeException("Invalid role id");
        }
    }
}
