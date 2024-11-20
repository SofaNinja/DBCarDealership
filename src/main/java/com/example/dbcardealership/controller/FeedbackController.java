package com.example.dbcardealership.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FeedbackController {
    @GetMapping("/feedback")
    public String feedbackForm() {
        return "feedback";
    }

    @PostMapping("/submit-feedback")
    public String submitFeedback(@RequestParam("firstName") String firstName,
                                 @RequestParam("surname") String surname,
                                 @RequestParam("email") String email,
                                 @RequestParam("text") String text) {

        return "redirect:/feedback?success";
    }
}
