package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.Customer;
import com.payroll.super_admin.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Year;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping
    public String listCategory(Model model) {
        model.addAttribute("categories", categoryService.getAllCategory());
        return "th/categories/categories";
    }
    @GetMapping("/add")
    public String addCategory(Model model) {
        return "th/categories/addBlog";
    }
    @PostMapping
    public String saveCategory(@ModelAttribute("category") BcaBlogCategories blogCategories,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/categories/categories";
        }
        try {
            categoryService.createCategory(blogCategories);
            redirectAttributes.addFlashAttribute("success", "Category created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/category";
    }
    @PostMapping("/update")
    public String updateCategory(@ModelAttribute("category") BcaBlogCategories blogCategories,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/categories/categories";
        }
        try {
            categoryService.updateCategory(blogCategories.getId(), blogCategories);
            redirectAttributes.addFlashAttribute("success", "Category updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/category";
    }
}
