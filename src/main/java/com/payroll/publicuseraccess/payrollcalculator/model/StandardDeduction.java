package com.payroll.publicuseraccess.payrollcalculator.model;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "bc_standard_deduction")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

public class StandardDeduction {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    Long id;
    @Column(name = "payroll_period",nullable = false)
    private PaymentFrequency paymentFrequency;
    @Column(name = "single_or_multi_income",nullable = false)
    private double singleOrMultiIncome;
    @Column(name = "married_0_1_allowance",nullable = false)
    private double marriedZeroOrOne;
    @Column(name = "married_2_more_allowance",nullable = false)
    private double marriedTwoOrMore;
    @Column(name = "unmarried_head_of_household")
    private double unmarriedHeadOfHouseHold;
    @Column(name = "state_name",nullable = false)
    private String stateName;
    @Column(name = "`year`", nullable = false)
    private int year;


}
