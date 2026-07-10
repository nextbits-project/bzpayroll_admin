package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.BcaMembershipPlan;
import com.payroll.super_admin.repo.BcaMembershipPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MembershipPlanService {
    @Autowired
    BcaMembershipPlanRepository bcaMembershipPlanRepository;

    public List<BcaMembershipPlan> getAllMembershipPlanList() {
        return bcaMembershipPlanRepository.findAll();
    }
}
