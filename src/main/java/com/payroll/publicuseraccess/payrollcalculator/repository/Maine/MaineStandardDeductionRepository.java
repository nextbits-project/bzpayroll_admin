package com.payroll.publicuseraccess.payrollcalculator.repository.Maine;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.Maine.MaineStandardDeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaineStandardDeductionRepository extends JpaRepository<MaineStandardDeduction, Long> {
    List<MaineStandardDeduction> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
