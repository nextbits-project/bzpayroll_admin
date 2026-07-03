package com.payroll.publicuseraccess.payrollcalculator.model.Connecticut;
//table C - Phase-Out Add-back

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "tableC_phase_out_amount")
@Data
public class  TableCPhaseOutAddBack {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "`over`")
    private double over;

    @Column(name = "not_over")
    private double notOver;

    @Column(name = "phase_out_amount")
    private double phaseOutAmount;

    @Column(name = "withholding_code")
    private String withholdingCode;

    @Column(name = "`year`")
    private int year;


}
