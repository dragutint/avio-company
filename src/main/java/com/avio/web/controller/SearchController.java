package com.avio.web.controller;

import com.avio.bl.job.FlightLookupJob;
import com.avio.domain.Flight;
import com.avio.domain.helper.SearchFilterForm;
import com.avio.bl.exception.EmptyResourcesException;
import com.avio.bl.service.CurrencyService;
import com.avio.bl.service.FlightService;
import com.mashape.unirest.http.exceptions.UnirestException;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Date;
import java.util.List;
import java.util.TreeMap;

@Controller
@Log4j2
@SessionAttributes({"searchFilterForm"})
public class SearchController {
    @Autowired
    private FlightService flightService;
    @Autowired
    private CurrencyService currencyService;
    @Autowired
    private FlightLookupJob flightLookupJob;

    @GetMapping("/search")
    public String search(Model model) {
        model.addAttribute("currencies", currencyService.getAllCurrencies());
        model.addAttribute("searchFilterForm", new SearchFilterForm());
        return "search/search";
    }

    @PostMapping("/searchFlights")
    public String searchResults(Model model, @ModelAttribute SearchFilterForm searchFilterForm) throws UnirestException {

        log.debug("Doing search for criteria: {}", searchFilterForm);

        try {
            flightLookupJob.checkFlights();

            TreeMap<Date, List<Flight>> flights = flightService.search(searchFilterForm);
            model.addAttribute("flights", flights);
            model.addAttribute("searchFilterForm", searchFilterForm);
        } catch (EmptyResourcesException e){
            model.addAttribute("error", e.getMessage());
        } finally {
            model.addAttribute("currencies", currencyService.getAllCurrencies());
            return "search/search";
        }
    }

    @ModelAttribute("searchFilterForm")
    public SearchFilterForm getSearchFilterForm() {
        return new SearchFilterForm();
    }
}
