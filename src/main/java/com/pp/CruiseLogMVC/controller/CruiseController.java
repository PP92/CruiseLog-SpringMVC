package com.pp.CruiseLogMVC.controller;

import com.pp.CruiseLogMVC.entity.Cruise;
import com.pp.CruiseLogMVC.service.CruiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;

@Controller
public class CruiseController {

    @Autowired
    private CruiseService cruiseService;

    @GetMapping("/cruises")
    public String listCruises(Model model) {
        List<Cruise> cruisesList = cruiseService.getAllCruises();

        /*  init db if empty --> delete this if(){} statement if you want to have empty db   */
        if(cruisesList.isEmpty()) {
            cruiseService.initCruiseRepo();
            cruisesList = cruiseService.getAllCruises();
        }
        /*---------------------*/

        model.addAttribute("cruisesList", cruisesList);
        return "cruises-list";
    }

    @GetMapping("/cruiseForm")
    public String showCruiseForm(Model model) {
        Cruise cruise = new Cruise();
        model.addAttribute("cruise", cruise);
        return "cruise-form";
    }

    @GetMapping("/init")
    public String init() {
        cruiseService.initCruiseRepo();
        return "redirect:/cruises";
    }

    @PostMapping("/saveCruise")
    public String saveCruise(@ModelAttribute("cruise") Cruise cruise) {
        cruiseService.saveCruise(cruise);
        return "redirect:/cruises";
    }

    @GetMapping("/showCruise")
    public String showCruise(@ModelAttribute("cruiseId") Long id, Model model) {
        Cruise cruise = cruiseService.getCruise(id);
        model.addAttribute("cruise", cruise);
        return "cruise-view";
    }

    @GetMapping("/showCruiseUpdateForm")
    public String showCruiseUpdateFrom(@ModelAttribute("cruiseId") Long id, Model model) {
        Cruise cruise = cruiseService.getCruise(id);
        model.addAttribute("cruise", cruise);
        return "cruise-form";
    }
    @DeleteMapping("/deleteCruise")
    public String deleteCruise(@ModelAttribute("cruiseId") Long id) {
        cruiseService.deleteCruiseById(id);
        return "redirect:/cruises";
    }

    @PostMapping("/addRandomCruise")
    public String addRandomCruise() {
        Cruise cruise = cruiseService.getRandomCruise();
        cruiseService.saveCruise(cruise);
        return "redirect:/cruises";
    }

    @GetMapping("/showCruisesWhereDistanceGreaterThan")
    public String findCruisesByDistanceGreaterThan(Model model ,@RequestParam("distance") int distance){
        List<Cruise> cruisesList = cruiseService.findCruiseByDistanceGreaterThan(distance);
        model.addAttribute("cruisesList", cruisesList);
        model.addAttribute("filter","DistanceGreaterThan");
        return("cruises-list");
    }

    @GetMapping("/showCruisesByStartDateAfter")
    public String findCruisesByStartDateAfter(Model model ,@RequestParam("startDate") @DateTimeFormat(iso= DateTimeFormat.ISO.DATE) LocalDate startDate){
        List<Cruise> cruisesList = cruiseService.findCruisesByStartDateAfter(startDate);
        model.addAttribute("cruisesList", cruisesList);
        model.addAttribute("filter","StartDateAfter");
        return("cruises-list");
    }

}
