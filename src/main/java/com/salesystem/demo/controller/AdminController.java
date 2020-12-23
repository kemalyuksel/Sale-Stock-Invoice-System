package com.salesystem.demo.controller;

import com.salesystem.demo.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    public MapService mapService;

    @RequestMapping("/adminHome")
    public String home(Model model){

        model.addAttribute("stats",mapService.getAllStats());

        return "adminHome";
    }


}
