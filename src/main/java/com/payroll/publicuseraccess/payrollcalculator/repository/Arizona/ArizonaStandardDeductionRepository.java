package com.payroll.publicuseraccess.payrollcalculator.repository.Arizona;

import com.payroll.publicuseraccess.payrollcalculator.model.Arizona.ArizonaStandardDeduction;
import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ArizonaStandardDeductionRepository extends JpaRepository<ArizonaStandardDeduction, Long> {

    Optional<ArizonaStandardDeduction> findByFilingStatusAndYear(FilingStatus filingStatus, int year);
}
