package com.payroll.publicuseraccess.payrollcalculator.repository.Louisiana;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.Louisiana.LouisianaTaxCreditBracket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LouisianaTaxCreditRepository extends JpaRepository<LouisianaTaxCreditBracket, Long> {
    List<LouisianaTaxCreditBracket> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
