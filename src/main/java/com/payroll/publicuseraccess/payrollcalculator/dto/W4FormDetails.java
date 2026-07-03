package com.payroll.publicuseraccess.payrollcalculator.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class W4FormDetails {
    private PersonalInformation personalInformation;
    private double amountStep4a;
    private double amountStep4b;
    private boolean onlyHaveTwoJobs;

    }
