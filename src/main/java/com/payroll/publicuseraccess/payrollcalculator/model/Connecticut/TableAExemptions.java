package com.payroll.publicuseraccess.payrollcalculator.model.Connecticut;
//Table A - personal exemptions for connecticut

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tableA_exemptions")
@Data
public class TableAExemptions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "exemption_amount")
    private double exemptionAmount;

    @Column(name = "withholding_code")
    private String withholdingCode;

    @Column(name = "`year`")
    private int year;


}
