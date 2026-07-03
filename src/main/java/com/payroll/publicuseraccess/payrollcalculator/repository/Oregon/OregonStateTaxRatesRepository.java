package com.payroll.publicuseraccess.payrollcalculator.repository.Oregon;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.Oregon.OregonTaxRates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OregonStateTaxRatesRepository extends JpaRepository<OregonTaxRates, Long> {
    List<OregonTaxRates> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
