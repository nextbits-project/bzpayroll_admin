package com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut;

import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.TableAExemptions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableAExemptionsRepository extends JpaRepository<TableAExemptions,Long> {
    List<TableAExemptions> findByWithholdingCodeAndYear(String withholdingCode, int year);
}
