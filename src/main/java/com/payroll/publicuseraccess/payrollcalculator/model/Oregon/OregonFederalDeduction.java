package com.payroll.publicuseraccess.payrollcalculator.model.Oregon;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_oregon_federal_deduction")
@Data
public class OregonFederalDeduction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`year`", nullable = false)
    private int year;

    @Column(name ="filing_status")
    private FilingStatus filingStatus;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "maximum_deduction_amount")
    private double maximumDeductionAmount;


}
