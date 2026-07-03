package com.payroll.publicuseraccess.payrollcalculator.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class PayType {
    private String method;
    private PaymentFrequency frequency;

   }
