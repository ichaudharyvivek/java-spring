package com.project.easybank.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactController {

    @GetMapping("/myContacts")
    public String getContactsDetails(){
        return "Here are the contact details from the DB";
    }
}
