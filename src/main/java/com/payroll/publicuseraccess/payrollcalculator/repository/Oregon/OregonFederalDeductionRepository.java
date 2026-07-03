package com.payroll.publicuseraccess.payrollcalculator.repository.Oregon;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.Oregon.OregonFederalDeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OregonFederalDeductionRepository extends JpaRepository<OregonFederalDeduction,Long> {
    List<OregonFederalDeduction> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
