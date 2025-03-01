package com.project.easybank.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class NoticesController {
    
    @GetMapping("/myNotices")
    public String getLoansDetails(){
        return "Here are the notice details from the DB";
    }
}
