package com.payroll.publicuseraccess.payrollcalculator.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "bc_flat_tax_rate")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class StateFlatTaxRate {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Id;

    @Column(name = "`year`")
    int year;

    @Column(name = "tax_rate")
    double taxRate;

    @Column(name = "exemption_amount")
    double exemptionAmount;

    @Column(name = "state_name")
    String stateName;


}
