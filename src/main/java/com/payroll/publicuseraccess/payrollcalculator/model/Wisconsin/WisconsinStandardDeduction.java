package com.payroll.publicuseraccess.payrollcalculator.model.Wisconsin;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_wisconsin_standard_deduction")
@Data
public class WisconsinStandardDeduction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "filing_status")
    private FilingStatus filingStatus;

    @Column(name = "`over`")
    private Double over;

    @Column(name = "not_over")
    private Double notOver;

    @Column(name = "deduction_amount")
    private double deductionAmount;

    @Column(name = "percentage")
    private double percentage;

    @Column(name = "`year`")
    private int year;


}