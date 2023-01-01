package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.models.BirthCertificate;
import com.chandra.spring.security.login.models.EBirthCertificateStatus;
import com.chandra.spring.security.login.payload.response.MessageResponse;
import com.chandra.spring.security.login.repository.BirthCertificateRepository;
import com.chandra.spring.security.login.security.services.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/csp")
public class AdminController {

    @Autowired
    BirthCertificateRepository birthCertificateRepository;

    @GetMapping({"/approverejectapplication"})
    @PreAuthorize("hasRole('ADMIN')")
    public ModelAndView approverejectapplication(ModelAndView model, Authentication auth) {
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        model.addObject("userDetails", userDetails);
        model.addObject("pendingRequests", birthCertificateRepository.findAllByStatus(EBirthCertificateStatus.PENDING));
        model.setViewName("approverejectapplication");
        return model;
    }

    @PutMapping({"/approverejectapplication"})
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> updateBirthCertStatus(Authentication auth, long bcId, EBirthCertificateStatus status) {
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        BirthCertificate birthCertificate =  birthCertificateRepository.findById(bcId).get();
        birthCertificate.setStatus(status);
        birthCertificate.setApprovedBy(userDetails.getId());
        return ResponseEntity.ok(new MessageResponse("Updated successfully!"));
    }
}
