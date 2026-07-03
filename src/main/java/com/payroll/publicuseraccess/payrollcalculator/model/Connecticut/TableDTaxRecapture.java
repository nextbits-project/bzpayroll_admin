package com.payroll.publicuseraccess.payrollcalculator.model.Connecticut;
//Table D - Tax Recapture

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tableD_tax_recapture")
@Data
public class TableDTaxRecapture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "recapture_amount")
    private double recaptureAmount;

    @Column(name = "withholding_code")
    private String withholdingCode;

    @Column(name = "`year`")
    private int year;


}
