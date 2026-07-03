package com.payroll.publicuseraccess.payrollcalculator.dto;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class PersonalInformation {
    private String firstName;
    private String middleName;
    private String lastName;
    private String address;
    private String cityOrTown;
    private String state;
    private String zipCode;
    private FilingStatus filingStatus;

   }
