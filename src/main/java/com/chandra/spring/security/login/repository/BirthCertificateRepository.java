package com.chandra.spring.security.login.repository;

import com.chandra.spring.security.login.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BirthCertificateRepository extends JpaRepository<BirthCertificate, Long> {
    List<BirthCertificate> findAllByAppliedBy(Long appliedBy);
    List<BirthCertificate> findAllByStatus(EBirthCertificateStatus status);

}
