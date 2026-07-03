package com.payroll.publicuseraccess.payrollcalculator.model.Connecticut;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tableB_tax_rates")
@Data
public class TableBTaxRates {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "plus")
    private double plus;
    
    @Column(name = "tax_rate")
    private double taxRate;

    @Column(name = "withholding_code")
    private String withholdingCode;

    @Column(name = "`year`")
    private int year;


}
