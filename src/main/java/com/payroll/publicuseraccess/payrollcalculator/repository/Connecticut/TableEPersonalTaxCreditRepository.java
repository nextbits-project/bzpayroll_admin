package com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut;

import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.TableEPersonalTaxCredit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableEPersonalTaxCreditRepository extends JpaRepository<TableEPersonalTaxCredit, Long> {
    List<TableEPersonalTaxCredit> findByWithholdingCodeAndYear(String withholdingCode, int year);
}
