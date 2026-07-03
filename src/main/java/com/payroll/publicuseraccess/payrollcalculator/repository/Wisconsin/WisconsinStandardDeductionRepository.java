package com.payroll.publicuseraccess.payrollcalculator.repository.Wisconsin;

import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.Wisconsin.WisconsinStandardDeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WisconsinStandardDeductionRepository extends JpaRepository<WisconsinStandardDeduction, Long> {
        List<WisconsinStandardDeduction> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
