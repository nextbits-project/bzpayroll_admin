package com.payroll.publicuseraccess.payrollcalculator.model.Maine;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_maine_standard_deduction")
@Data
public class MaineStandardDeduction {

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

        @Column(name = "`year`")
        private int year;


}

