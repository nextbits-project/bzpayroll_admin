package com.payroll.publicuseraccess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("")
public class HomeController {

    @GetMapping
    public String showHomePage(Model model) {
        model.addAttribute("title", "Welcome to BZPayroll");
        return "thymeleaf/dashboard/index"; // This should match src/main/resources/templates/index.html
    }

    @GetMapping("/about")
    public String showAboutPage() {
        return "thymeleaf/dashboard/about";
    }

    @GetMapping("/services")
    public String showServicesPage() {
        return "thymeleaf/dashboard/services";
    }

    @GetMapping("/what-is-bzpayroll")
    public String showWhatIsBzPayrollPage() {
        return "thymeleaf/dashboard/what-is-bzpayroll";
    }

    @GetMapping("/free-payroll")
    public String showPricingPage() {
        return "forward:/WEB-INF/jsp/free_payroll_tax_calculator.jsp";
    }
    @GetMapping("/tax-admin")
    public String showTaxAdmin() {
        return "forward:/WEB-INF/jsp/tax_admin.jsp";
    }


    @GetMapping("/contact")
    public String showContactPage() {
        return "forward:/WEB-INF/jsp/contactUs.jsp";
    }

    @GetMapping("/login")
    public String showLoginPage(@RequestParam(value = "error", required = false) String error,Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", "Invalid username or password");
        }
        return "forward:/WEB-INF/jsp/login.jsp";
    }


}
