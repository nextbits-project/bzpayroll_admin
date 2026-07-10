package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.MembershipPlanDto;
import com.payroll.super_admin.entity.BcaMembershipPlan;
import com.payroll.super_admin.repo.BcaMembershipPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class MembershipPlanService {
    @Autowired
    BcaMembershipPlanRepository bcaMembershipPlanRepository;

    public List<BcaMembershipPlan> getAllMembershipPlanList() {
        return bcaMembershipPlanRepository.findAll();
    }

    public void saveMembershipPlan(MembershipPlanDto membershipPlanDto) {
        BcaMembershipPlan bcaMembershipPlan = new BcaMembershipPlan();

        if (membershipPlanDto.getPlanName() != null){
            bcaMembershipPlan.setPlanName(membershipPlanDto.getPlanName());
        }
        if (membershipPlanDto.getPlanName() != null && !membershipPlanDto.getPlanName().trim().isEmpty()) {
            String planName = membershipPlanDto.getPlanName().trim();

            bcaMembershipPlan.setPlanName(planName);

            String planCode = planName
                    .toUpperCase()
                    .replaceAll("\\s+", "_");

            bcaMembershipPlan.setPlanCode(planCode);
        }
        if (membershipPlanDto.getAmount() != null){
            bcaMembershipPlan.setAmount(new BigDecimal(membershipPlanDto.getAmount()));
        }
        if (membershipPlanDto.getBillingInterval() != null){
            bcaMembershipPlan.setBillingInterval(membershipPlanDto.getBillingInterval());
        }
        if (membershipPlanDto.getEmployeeLimit() != null){
            bcaMembershipPlan.setEmployeeLimit(membershipPlanDto.getEmployeeLimit());
        }
        if (membershipPlanDto.getDescription() != null){
            bcaMembershipPlan.setDescription(membershipPlanDto.getDescription());
        }
        bcaMembershipPlan.setCurrency("USD");
        bcaMembershipPlan.setCreatedAt(LocalDateTime.now());
        bcaMembershipPlan.setActive(true);
        bcaMembershipPlanRepository.save(bcaMembershipPlan);
    }

    public void updateMembershipPlan(MembershipPlanDto membershipPlanDto) {
        BcaMembershipPlan bcaMembershipPlan = bcaMembershipPlanRepository
                .findById(Integer.parseInt(membershipPlanDto.getId()))
                .orElseThrow(() -> new RuntimeException("Membership Plan not found"));

        if (membershipPlanDto.getPlanName() != null){
            bcaMembershipPlan.setPlanName(membershipPlanDto.getPlanName());
        }
        if (membershipPlanDto.getPlanName() != null && !membershipPlanDto.getPlanName().trim().isEmpty()) {
            String planName = membershipPlanDto.getPlanName().trim();

            bcaMembershipPlan.setPlanName(planName);

            String planCode = planName
                    .toUpperCase()
                    .replaceAll("\\s+", "_");

            bcaMembershipPlan.setPlanCode(planCode);
        }
        if (membershipPlanDto.getAmount() != null){
            bcaMembershipPlan.setAmount(new BigDecimal(membershipPlanDto.getAmount()));
        }
        if (membershipPlanDto.getBillingInterval() != null){
            bcaMembershipPlan.setBillingInterval(membershipPlanDto.getBillingInterval());
        }
        if (membershipPlanDto.getEmployeeLimit() != null){
            bcaMembershipPlan.setEmployeeLimit(membershipPlanDto.getEmployeeLimit());
        }
        if (membershipPlanDto.getDescription() != null){
            bcaMembershipPlan.setDescription(membershipPlanDto.getDescription());
        }
        bcaMembershipPlan.setCreatedAt(LocalDateTime.now());

        bcaMembershipPlanRepository.save(bcaMembershipPlan);
    }

    public void deleteMembershipPlan(String id) {
        bcaMembershipPlanRepository.deleteById(Integer.parseInt(id));
    }
}
