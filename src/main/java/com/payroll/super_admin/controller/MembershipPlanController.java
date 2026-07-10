package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.BlogDto;
import com.payroll.super_admin.dto.MembershipPlanDto;
import com.payroll.super_admin.entity.BcaMembershipPlan;
import com.payroll.super_admin.service.MembershipPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/membership")
public class MembershipPlanController {

    @Autowired
    private MembershipPlanService membershipPlanService;

    @GetMapping
    public String membership(Model model) {
        List<BcaMembershipPlan> bcaMembershipPlanList = membershipPlanService.getAllMembershipPlanList();
        model.addAttribute("membershipPlanList", bcaMembershipPlanList);
        return "th/membership/membership";
    }

    @PostMapping
    public String saveMembershipPlan(@ModelAttribute("membershipPlan") MembershipPlanDto membershipPlanDto,
                           BindingResult result,
                           RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/membership/membership";
        }
        try {
            membershipPlanService.saveMembershipPlan(membershipPlanDto);
            redirectAttributes.addFlashAttribute("success", "Membership plan created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/membership";
    }
    @PostMapping("/update")
    public String updateMembershipPlan(@ModelAttribute("membershipPlan") MembershipPlanDto membershipPlanDto,
                                     BindingResult result,
                                     RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/membership/membership";
        }
        try {
            membershipPlanService.updateMembershipPlan(membershipPlanDto);
            redirectAttributes.addFlashAttribute("success", "Membership plan updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/membership";
    }
    @PostMapping("/delete")
    public String deleteMembershipPlan(@ModelAttribute("membershipPlan") MembershipPlanDto membershipPlanDto,
                                       BindingResult result,
                                       RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/membership/membership";
        }
        try {
            membershipPlanService.deleteMembershipPlan(membershipPlanDto.getId());
            redirectAttributes.addFlashAttribute("success", "Membership plan delete successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/membership";
    }
}
