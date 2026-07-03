package com.payroll.publicuseraccess.payrollcalculator.dto;
//This dto is to collect form 4-A information for Arizona Tax Calculation
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Form4aDetails {

    //Employee will select tax percentage from 0 to 3.5
    Double taxPercentageRate;

    //Employee can expect to have no Arizona tax liability for the current taxable year.
    boolean noArizonaTaxLiability;


}
