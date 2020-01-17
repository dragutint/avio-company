package com.avio.web.controller;

import com.avio.domain.Aeroplane;
import com.avio.bl.service.AeroplaneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AeroplaneController {

    @Autowired
    private AeroplaneService aeroplaneService;

    @RequestMapping("/aeroplanes")
    public String aeroplanes(ModelMap model){
        List<Aeroplane> aeroplanes = aeroplaneService.find();
        model.addAttribute("aeroplanes", aeroplanes);
        return "aero/aeroplanes";
    }
}
