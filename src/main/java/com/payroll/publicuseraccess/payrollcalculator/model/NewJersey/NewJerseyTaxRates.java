package com.payroll.publicuseraccess.payrollcalculator.model.NewJersey;

import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_new_jersey_tax_rates")
@Data
public class NewJerseyTaxRates {

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

    @Column(name = "rate_code")
    private String rateCode;

    @Column(name = "`year`")
    private int year;


}
