package com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut;

import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.TableBTaxRates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableBTaxRatesRepository extends JpaRepository<TableBTaxRates, Long> {
    List<TableBTaxRates> findByWithholdingCodeAndYear(String withholdingCode, int year);
}
