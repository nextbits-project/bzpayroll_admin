package com.payroll.publicuseraccess.payrollcalculator.model.Arizona;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "arizona_standard_tax")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ArizonaStandardDeduction {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "`year`")
    int year;

    @Column(name = "filing_status")
    FilingStatus filingStatus;

    @Column(name = "deduction_amount")
    double deductionAmount;

   }
