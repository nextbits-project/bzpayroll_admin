package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.BcaMembershipPlan;
import com.payroll.super_admin.service.AdminUserService;
import com.payroll.super_admin.service.MembershipPlanService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class AdminDashboardController {

    private static final Logger logger = LoggerFactory.getLogger(AdminDashboardController.class);

    @Autowired
    private AdminUserService adminUserService;

    @GetMapping("/")
    public String admin(Model model) {
        model.addAttribute("error", null);
        return "th/signin";
    }

    @PostMapping("/admin_login")
    public String login(@RequestParam String name, @RequestParam String password,
                        HttpServletRequest request, Model model) {
        System.out.println("name : " + name + " password : " + password + "******************");
        if (adminUserService.authenticate(name, password)) {
            // Set legacy session attribute
            HttpSession session = request.getSession(true);
            session.setAttribute("CID", name);
            request.getSession().setAttribute("CID", name);
            session.setAttribute("ROLE", "ADMIN");
            request.getSession().setAttribute("ROLE", "ADMIN");
            return "redirect:/admin_dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "th/signin";
        }
    }

    @GetMapping("/admin_login")
    public String showLoginForm(
            @RequestParam(value = "invalid-session", required = false) String invalidSession,
            @RequestParam(value = "message", required = false) String message,
            Model model) {

        if (invalidSession != null) {
            model.addAttribute("error",
                    "Your session has expired. Please log in again.");
        } else if (message != null) {
            model.addAttribute("error", message);
        }

        return "th/signin";
    }

    /**
     * Admin Dashboard main page
     */
    @GetMapping("/admin_dashboard")
    public String adminDashboard(Model model, HttpSession session) {
        String username = (String) session.getAttribute("CID");
        logger.debug("Accessing admin dashboard for user: {}", username);
        model.addAttribute("username", username);
        // Add dashboard data (e.g., charts, metrics)
        model.addAttribute("customerCount", 12000); // Placeholder
        model.addAttribute("totalOrders", 84000); // Placeholder
        model.addAttribute("productViews", 3000000); // Placeholder
        model.addAttribute("totalIncome", 59000); // Placeholder
        return "th/Admin_dashboard";
    }

    /**
     * Federal Tax main page
     */
    @GetMapping("/federal_tax")
    public String federalTax(Model model, HttpSession session) {
        String username = (String) session.getAttribute("CID");
        return "th/Federal_tax";
    }

    /**
     * State Tax main page
     */
    @GetMapping("/state_tax")
    public String stateTax(Model model, HttpSession session) {
        String username = (String) session.getAttribute("CID");
        return "th/State_tax";
    }
    @GetMapping("/admin_products")
    public String product() {
        return "th/products";
    }
}
