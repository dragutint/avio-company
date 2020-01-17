package com.avio.web.controller;

import com.avio.domain.Client;
import com.avio.domain.Role;
import com.avio.domain.User;
import com.avio.bl.service.ClientService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@Log4j2
public class LoginController {
	@Autowired
	private ClientService clientService;
	
	@GetMapping("/login")
	public String loginForma() {
		return "login/login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}
	
	@RequestMapping("/unauthorized-access")
	public String unauthorizedAccess(Model model) {
		
		return "login/unauthorized-access";
	}


	@RequestMapping("/register")
	public String register(Model model){
		Client c = new Client();
		User u = new User();
		u.setRole(new Role(2, "client"));
		c.setUser(u);

		model.addAttribute("client", c);

		return "login/register";
	}

	@RequestMapping("/saveClient")
	public String saveClient(Model model, @ModelAttribute Client c){

		c.getUser().setRole(new Role(2, ""));

		log.debug("New client is registered: {}", c);
		clientService.save(c);

		return "redirect:/login";
	}
	
	public static String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
