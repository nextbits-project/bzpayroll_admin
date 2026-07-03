package com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut;

import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.TableCPhaseOutAddBack;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableCPhaseOutRepository extends JpaRepository<TableCPhaseOutAddBack, Long> {
    List<TableCPhaseOutAddBack> findByWithholdingCodeAndYear(String withholdingCode, int year);
}
