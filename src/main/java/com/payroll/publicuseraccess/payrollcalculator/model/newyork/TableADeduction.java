package com.payroll.publicuseraccess.payrollcalculator.model.newyork;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
/*
     Table A - Combined deduction and exemption allowance
*/

@Entity
@Table(name = "table_a_deduction")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class TableADeduction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "filing_status")
    private String filingStatus;

    @Column(name = "payroll_period")
    private Integer paymentFrequency;

    // Predefined deduction allowance from Table B
    @Column(name = "deduction_amount")
    private Double baseDeductionAmount;

    //incrementer is predefined exemption allowance from Table C.
    @Column(name = "incrementer")
    private Double incrementer;

    @Column(name = "`year`")
    private Integer year;


}
