package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.TemplateDTO;
import com.payroll.super_admin.service.EmailTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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

}
