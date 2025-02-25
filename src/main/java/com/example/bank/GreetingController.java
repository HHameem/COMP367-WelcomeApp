package com.example.bank;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalTime;

@Controller
public class GreetingController {

    @GetMapping("/")
    public String greeting(Model model) {
        int hour = LocalTime.now().getHour();
        String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
        model.addAttribute("greeting", greeting);
        model.addAttribute("name", "Hafshan Hameem");
        return "index";
    }
}
