package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.models.BirthCertificate;
import com.chandra.spring.security.login.models.User;
import com.chandra.spring.security.login.payload.request.BirthCertificateRequest;
import com.chandra.spring.security.login.payload.request.SignupRequest;
import com.chandra.spring.security.login.payload.response.MessageResponse;
import com.chandra.spring.security.login.repository.BirthCertificateRepository;
import com.chandra.spring.security.login.repository.UserRepository;
import com.chandra.spring.security.login.security.services.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/csp")
public class CitizenController {

    @Autowired
    BirthCertificateRepository birthCertificateRepository;


    @Autowired
    UserRepository userRepository;

    @GetMapping({"/applybirthcertificate"})
    @PreAuthorize("hasRole('USER')")
    public ModelAndView bcForm(ModelAndView model, Authentication auth) {
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        model.addObject("userDetails", userDetails);
        model.setViewName("applybirthcertificate");
        return model;
    }

    @PostMapping({"/applybirthcertificate"})
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> requestForBC(@Valid @RequestBody BirthCertificateRequest req, Authentication auth) {
        BirthCertificate birthCertificate = BirthCertificate.buildBCFromReq(req);
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        birthCertificate.setAppliedBy(userDetails.getId());
        birthCertificateRepository.save(birthCertificate);
        return ResponseEntity.ok(new MessageResponse("requested successfully"));
    }

    @GetMapping({"/viewbcstatus"})
    @PreAuthorize("hasRole('USER')")
    public ModelAndView viewStatus(ModelAndView model, Authentication auth) {
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        model.addObject("userDetails", userDetails);
        model.addObject("pendingRequests", birthCertificateRepository.findAllByAppliedBy(userDetails.getId()));
        model.setViewName("viewbcstatus");
        return model;
    }

}
