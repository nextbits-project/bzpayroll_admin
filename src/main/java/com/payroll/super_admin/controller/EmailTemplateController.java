package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.EmailTemplateRequest;
import com.payroll.super_admin.dto.TemplateDTO;
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
@RequestMapping("/email-templates")
public class EmailTemplateController {
    @Autowired
    EmailTemplateService templateService;

    @GetMapping
    public String page(Model model) {
        List<CategoryDTO.CategoryInfo> categories = templateService.getAllCategories();
        model.addAttribute("categories", categories);
        return "th/EmailTemplates/EmailTemplate";
    }

    @GetMapping("/category/{code}/templates")
    @ResponseBody
    public ResponseEntity<List<TemplateDTO>> getTemplatesByCategory(@PathVariable String code) {
        return ResponseEntity.ok(templateService.getTemplatesByCategory(code));
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<TemplateDTO> getTemplateById(@PathVariable Long id) {
        return ResponseEntity.ok(templateService.getTemplateById(id));
    }

    @PostMapping("/category/template/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addTemplate(
            @RequestBody EmailTemplateRequest request) {
        templateService.addTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template Added successfully");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/category/template/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateTemplate(
            @RequestBody EmailTemplateRequest request) {
        templateService.updateTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template updated successfully");

        return ResponseEntity.ok(response);
    }

    @PostMapping("/category/template/delete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteTemplate(
            @RequestBody EmailTemplateRequest request) {
        templateService.deleteTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template Deleted successfully");

        return ResponseEntity.ok(response);
    }
}