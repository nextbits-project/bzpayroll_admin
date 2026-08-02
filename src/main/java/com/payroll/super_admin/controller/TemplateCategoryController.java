package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.CategoryTemplateRequest;
import com.payroll.super_admin.service.CategoryTemplateService;
import com.payroll.super_admin.service.EmailTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/email-template-category")
public class TemplateCategoryController {

    @Autowired
    private EmailTemplateService templateService;
    @Autowired
    private CategoryTemplateService categoryTemplateService;

    @GetMapping
    public String getAllTemplateCategory(Model model) {
        List<CategoryDTO.CategoryInfo> categories = templateService.getAllCategories();
        model.addAttribute("categories", categories);
        return "th/templateCategory/templateCategory";
    }

    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addTemplate(
            @RequestBody CategoryTemplateRequest request) {
        categoryTemplateService.addTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Category Added successfully");

        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateTemplate(
            @RequestBody CategoryTemplateRequest request) {
        categoryTemplateService.updateTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Category Updated successfully");

        return ResponseEntity.ok(response);
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteTemplate(@PathVariable Long id) {
        categoryTemplateService.deleteTemplate(id);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Category Deleted successfully");
        return ResponseEntity.ok(response);
    }
}
