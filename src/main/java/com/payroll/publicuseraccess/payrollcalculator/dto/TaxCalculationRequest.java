package com.payroll.publicuseraccess.payrollcalculator.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class TaxCalculationRequest {
    private List<IncomeRate> incomeInfo;
    private double grossPay;
    private FederalInformation federalInformation;
    private boolean useW4;
    private W4FormDetails w4Form;
    private Form4aDetails form4aDetails;
    private String state;
    private Date checkDate;
    private PayType payType;
    private ExemptionInfo exemptionInfo;
    private int year;
    @JsonProperty("nAllowances")
    private int nAllowances;
    private int basicAllowances;
    private int additionalAllowances;
    private FilingStatus stateFilingStatus;
    private String withholdingCode;
    private int totalAllowanceAmount;
    private boolean headOfHousehold;
    private boolean personalBlindness;
    private boolean spouseBlindness;

   }
