package com.payroll.publicuseraccess.payrollcalculator.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "bc_federal_tax_rates")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class FederalTaxRate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tax_year", nullable = false)
    private int taxYear;

    @Column(name = "filing_status", nullable = false)
    private String filingStatus;

    @Column(name = "w4_form", nullable = false)
    private String w4Form;  // "Yes" or "No"

    @Column(name = "at_least", nullable = false)
    private double atLeast;

    @Column(name = "less_than")
    private double lessThan;

    @Column(name = "tentative_amount_to_withhold", nullable = false)
    private double tentativeAmountToWithhold;

    @Column(name = "tax_rate", nullable = false)
    private double taxRate;

    @Column(name = "adjusted_annual_wage", nullable = false)
    private double adjustedAnnualWage;

   }
