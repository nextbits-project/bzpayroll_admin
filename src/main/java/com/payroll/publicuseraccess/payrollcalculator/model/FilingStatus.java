package com.payroll.publicuseraccess.payrollcalculator.model;

public enum FilingStatus {

    MARRIED_FILING_JOINTLY("Married Filing Jointly"),
    HEAD_OF_HOUSEHOLD("Head of Household"),
    SINGLE_OR_MARRIED_FILING_SEPARATELY("Single or Married Filing Separately");
    public final String status;

    FilingStatus(String status){
        this.status=status;
    }
}
