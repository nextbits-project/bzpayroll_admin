package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.Customer;
import com.payroll.super_admin.repo.CustomerRepository;
import com.payroll.super_admin.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Year;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/customers")
public class CustomerController {

    @Autowired
    CustomerService customerService;
    @Autowired
    CustomerRepository customerRepository;


    @GetMapping
    public String listCustomers(Model model) {
        model.addAttribute("customers", customerService.getAllCustomers());
        model.addAttribute("customer", new Customer());
        model.addAttribute("currentYear", Year.now().getValue());
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "th/customers/customers";
    }

    @GetMapping("/active")
    public String listActiveCustomers(Model model) {
        model.addAttribute("customers", customerService.getActiveCustomers());
        model.addAttribute("customer", new Customer());
        model.addAttribute("currentYear", Year.now().getValue());
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "th/customers/customers";
    }

    @GetMapping("/inactive")
    public String listInactiveCustomers(Model model) {
        model.addAttribute("customers", customerService.getInactiveCustomers());
        model.addAttribute("customer", new Customer());
        model.addAttribute("currentYear", Year.now().getValue());
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "th/customers/customers";
    }

    @GetMapping("/modal/add")
    public String getAddModal(Model model) {
        model.addAttribute("customer", new Customer());
        return "fragments/customer_fragments/add :: addModal";
    }

    @GetMapping("/modal/view/{id}")
    public String getViewModal(@PathVariable Long id, Model model) {
        model.addAttribute("customer", customerService.getCustomerById(id));
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "fragments/customer_fragments/view :: viewModal";
    }

    @GetMapping("/modal/edit/{id}")
    public String getEditModal(@PathVariable Long id, Model model) {
        model.addAttribute("customer", customerService.getCustomerById(id));
        return "fragments/customer_fragments/edit :: editModal";
    }

    @PostMapping
    public String saveCustomer(@ModelAttribute("customer") Customer customer,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/customers/customers";
        }
        try {
            customerService.createCustomer(customer);
            redirectAttributes.addFlashAttribute("success", "Customer created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/customers";
    }

    @PostMapping("/update")
    public String updateCustomer(@ModelAttribute("customer") Customer customer,
                                 BindingResult result,
                                 RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/customers/customers";
        }
        try {
            customerService.updateCustomer(customer.getId(), customer);
            redirectAttributes.addFlashAttribute("success", "Customer updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/customers";
    }

    @PostMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            customerService.deleteCustomer(id);
            redirectAttributes.addFlashAttribute("success", "Customer deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/customers";
    }

    @PostMapping("/{id}/toggle-status")
    public String toggleStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            Customer customer = customerService.toggleCustomerStatus(id);
            String status = customer.isActive() ? "activated" : "deactivated";
            redirectAttributes.addFlashAttribute("success", "Customer " + status);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/customers";
    }
}