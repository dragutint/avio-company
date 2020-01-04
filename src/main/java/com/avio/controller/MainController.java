package com.avio.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
public class MainController {

    @RequestMapping("")
    public String search() {
         return "search/search";
    }
}
