package com.payroll.publicuseraccess.payrollcalculator.model.Connecticut;

import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "tableE_personal_tax_credits")
@Data
public class TableEPersonalTaxCredit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "credit_amount")
    private double creditAmount;

    @Column(name = "withholding_code")
    private String withholdingCode;

    @Column(name = "`year`")
    private int year;


}
