package com.payroll.publicuseraccess.payrollcalculator.repository.NewJersey;

import com.payroll.publicuseraccess.payrollcalculator.model.NewJersey.NewJerseyTaxRates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewJerseyRepository extends JpaRepository<NewJerseyTaxRates, Long> {
    List<NewJerseyTaxRates> findByRateCodeAndYear(String rateCode, int year);

}
