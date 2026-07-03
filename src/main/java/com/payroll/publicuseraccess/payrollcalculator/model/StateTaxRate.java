package com.payroll.publicuseraccess.payrollcalculator.model;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "bc_state_tax_rate")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class StateTaxRate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "payroll_period",nullable = false)
    private PaymentFrequency paymentFrequency;
    @Column(name = "filing_status",nullable = false)
    private FilingStatus filingStatus;
    @Column(name = "`over`",nullable = false)
    private double  over;
    @Column(name = "not_over",nullable = false)
    private double notOver;
    @Column(name = "tax_rate",nullable = false)
    private double taxRate;
    @Column(name = "plus",nullable = false)
    private double plus;
    @Column(name = "state_name",nullable = false)
    private String stateName;
    @Column(name = "`year`", nullable = false)
    private int year;


}
