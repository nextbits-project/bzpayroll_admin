package com.payroll.publicuseraccess.payrollcalculator.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class AccountTaxCreditInformation {
    private double amountW4FormStep3;

   }
