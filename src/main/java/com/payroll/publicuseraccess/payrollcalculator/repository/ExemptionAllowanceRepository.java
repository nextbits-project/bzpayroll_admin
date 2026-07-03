package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.model.ExemptionAllowance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExemptionAllowanceRepository extends JpaRepository<ExemptionAllowance, Long> {
    List<ExemptionAllowance> findByStateNameAndYear(String stateName, Integer year);
}
