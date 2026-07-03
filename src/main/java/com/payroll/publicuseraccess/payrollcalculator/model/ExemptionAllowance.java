package com.payroll.publicuseraccess.payrollcalculator.model;

import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "bc_exemption_allowance")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class ExemptionAllowance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "allowance_at_least", nullable = false)
    private int nAtLeastAllowance;
    @Column(name = "weekly",nullable = false)
    private double weekly;
    @Column(name = "bi_weekly",nullable = false)
    private double biWeekly;
    @Column(name = "semi_monthly",nullable = false)
    private double semiMonthly;
    @Column(name = "monthly",nullable = false)
    private double monthly;
    @Column(name = "quarterly",nullable = false)
    private double quarterly;
    @Column(name = "semi_annual",nullable = false)
    private double semiAnnually;
    @Column(name = "annual",nullable = false)
    private double annual;
    @Column(name = "daily",nullable = false)
    private double daily;
    @Column(name = "state",nullable = false)
    private String stateName;
    @Column(name = "year", nullable = false)
    private int year;


}
