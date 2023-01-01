package com.chandra.spring.security.login.payload.request;

import com.chandra.spring.security.login.models.EBirthCertificateStatus;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Date;

public class BirthCertificateRequest {
    private Long appliedBy;

    private Long approvedBy;

    private EBirthCertificateStatus status;

    @NotBlank
    private String addressProofLocation;

    @NotNull
    private Date dob;


    @NotBlank
    @Size(max = 1)
    private String gender;

    @NotBlank
    @Size(max = 10)
    private String zipCode;

    @NotBlank
    @Size(max = 50)
    private String state;

    @NotBlank
    @Size(max = 50)
    private String district;

    @NotBlank
    @Size(max = 50)
    private String placeOfBirth;

    @NotBlank
    @Size(max = 50)
    private String childName;

    @NotBlank
    @Size(max = 50)
    private String fatherName;

    @NotBlank
    @Size(max = 50)
    private String motherName;

    public Long getAppliedBy() {
        return appliedBy;
    }

    public void setAppliedBy(Long appliedBy) {
        this.appliedBy = appliedBy;
    }

    public Long getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(Long approvedBy) {
        this.approvedBy = approvedBy;
    }

    public EBirthCertificateStatus getStatus() {
        return status;
    }

    public void setStatus(EBirthCertificateStatus status) {
        this.status = status;
    }

    public String getAddressProofLocation() {
        return addressProofLocation;
    }

    public void setAddressProofLocation(String addressProofLocation) {
        this.addressProofLocation = addressProofLocation;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getChildName() {
        return childName;
    }

    public void setChildName(String childName) {
        this.childName = childName;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }
}
