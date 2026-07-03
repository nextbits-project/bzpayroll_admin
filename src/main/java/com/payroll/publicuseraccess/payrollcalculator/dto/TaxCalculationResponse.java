package com.payroll.publicuseraccess.payrollcalculator.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class TaxCalculationResponse {
    private String status;
    private double federalTax;
    private double medicareTax;
    // FICA tax is social security tax
    private double ficaTax;
    private double netPay;
    private double stateTax;


}
