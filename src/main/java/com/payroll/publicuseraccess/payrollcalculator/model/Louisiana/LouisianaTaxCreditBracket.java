package com.payroll.publicuseraccess.payrollcalculator.model.Louisiana;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_louisiana_tax_bracket")
@Data
public class LouisianaTaxCreditBracket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "filing_status")
    private FilingStatus filingStatus;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "plus")
    private double plus;

    @Column(name = "tax_rate")
    private double taxRate;

    @Column(name = "`year`")
    private int year;


}
