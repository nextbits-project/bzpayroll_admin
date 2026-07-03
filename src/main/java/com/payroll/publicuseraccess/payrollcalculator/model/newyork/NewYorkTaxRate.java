package com.payroll.publicuseraccess.payrollcalculator.model.newyork;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Table(name = "new_york_tax_rate")
public class NewYorkTaxRate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`year`", nullable = false)
    private Integer year;

    @Column(name = "filing_status", nullable = false)
    private String filingStatus;

    @Column(name = "payroll_period",nullable = false)
    private Integer paymentFrequency;

    //Column 1
    @Column(name = "column_1", nullable = false)
    private Double atLeast;

    //Column 2
    @Column(name = "column_2", nullable = false)
    private Double notOver;

    @Column(name = "column_3", nullable = false)
    private Double column3;

    @Column(name = "column_4", nullable = false)
    private Double column4;

    @Column(name = "column_5", nullable = false)
    private Double column5;


}
