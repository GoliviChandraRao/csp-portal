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
public class CitizenController {

  @GetMapping("/test")
  @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
  public String userAccess() {
    return "User Content.";
  }


  @GetMapping({"/applybirthcertificate"})
  @PreAuthorize("hasRole('USER')")
  public ModelAndView applybirthcertificate(ModelAndView model) {
    model.setViewName("applybirthcertificate");
    return model;
  }

  @GetMapping({"/viewbcstatus"})
  @PreAuthorize("hasRole('USER')")
  public ModelAndView viewbcstatus(ModelAndView model) {
    model.setViewName("viewbcstatus");
    return model;
  }

}
