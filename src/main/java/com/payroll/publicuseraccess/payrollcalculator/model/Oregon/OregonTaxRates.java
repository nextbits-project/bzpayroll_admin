package com.payroll.publicuseraccess.payrollcalculator.model.Oregon;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "bc_oregon_tax_rates")
@Data
public class OregonTaxRates {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(name = "filing_status")
        private FilingStatus filingStatus;
        
        @Column(name = "`over`")
        private double  over;
        
        @Column(name = "not_over")
        private double notOver;
        
        @Column(name = "tax_rate")
        private double taxRate;

        @Column(name = "plus")
        private double plus;

        @Column(name = "minimum_wage_threshold")
        private double minimumWageThreshold;

        @Column(name = "maximum_wage_threshold")
        private double maximumWageThreshold;

        @Column(name = "`year`")
        private int year;


}

