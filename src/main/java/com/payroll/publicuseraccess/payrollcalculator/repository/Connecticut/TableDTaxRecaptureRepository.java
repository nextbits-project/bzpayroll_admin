package com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut;

import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.TableDTaxRecapture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableDTaxRecaptureRepository extends JpaRepository<TableDTaxRecapture, Long> {
    List<TableDTaxRecapture> findByWithholdingCodeAndYear(String withholdingCode, int year);
}
