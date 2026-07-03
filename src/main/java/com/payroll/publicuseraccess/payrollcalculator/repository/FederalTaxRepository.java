package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.model.FederalTaxRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FederalTaxRepository extends JpaRepository<FederalTaxRate,Long> {
    List<FederalTaxRate> findByTaxYearAndFilingStatusAndW4Form(Integer taxYear, String filingStatus, String w4Form);
    List<FederalTaxRate> findByTaxYear(Integer taxYear);
}
