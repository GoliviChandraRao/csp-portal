package com.chandra.spring.security.login.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/csp")
public class AdminController {

  @GetMapping({"/approverejectapplication"})
  @PreAuthorize("hasRole('ADMIN')")
  public ModelAndView approverejectapplication(ModelAndView model) {
    model.setViewName("approverejectapplication");
    return model;
  }
}
