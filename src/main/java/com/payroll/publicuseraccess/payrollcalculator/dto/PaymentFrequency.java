package com.payroll.publicuseraccess.payrollcalculator.dto;


public enum PaymentFrequency {
    DAILY(265),
    WEEKLY(52),
    BI_WEEKLY(26),
    SEMI_MONTHLY(24),
    MONTHLY(12),
    QUARTERLY(4),
    ANNUALLY(1),
    SEMI_ANNUALLY(2);

    public final int frequencyNumber;

    PaymentFrequency(int frequencyNumber){
        this.frequencyNumber=frequencyNumber;
    }
}
