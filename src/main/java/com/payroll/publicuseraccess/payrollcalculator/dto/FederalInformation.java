package com.payroll.publicuseraccess.payrollcalculator.dto;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class FederalInformation {
    private FilingStatus filingStatus;
    private int federalAllowance;
    private double additionalWithholding;
    private boolean roundWithholding;
    private AccountTaxCreditInformation taxCreditInformation;


}
