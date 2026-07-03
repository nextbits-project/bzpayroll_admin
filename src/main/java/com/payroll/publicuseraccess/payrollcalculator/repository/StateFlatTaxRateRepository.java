package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.model.StateFlatTaxRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StateFlatTaxRateRepository extends JpaRepository<StateFlatTaxRate,Long> {
    Optional<StateFlatTaxRate> findByStateNameAndYear(String stateName, int year);
}
