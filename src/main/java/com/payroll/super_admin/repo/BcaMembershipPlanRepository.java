package com.payroll.super_admin.repo;
import com.payroll.super_admin.entity.BcaMembershipPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BcaMembershipPlanRepository extends JpaRepository<BcaMembershipPlan, Integer> {
    List<BcaMembershipPlan> findByActive(boolean active);
    BcaMembershipPlan findByPlanCode(String planCode);
}
