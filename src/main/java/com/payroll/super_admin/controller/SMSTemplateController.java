package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.SMSTemplateDTO;
import com.payroll.super_admin.dto.SmsTemplateRequest;
import com.payroll.super_admin.service.EmailTemplateService;
import com.payroll.super_admin.service.SMSTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sms-templates")
public class SMSTemplateController {

    @Autowired
    private EmailTemplateService templateService;

    @Autowired
    private SMSTemplateService smsTemplateService;

    @GetMapping
    public String page(Model model) {
        List<CategoryDTO.CategoryInfo> categories = templateService.getAllCategories();
        model.addAttribute("categories", categories);
        return "th/smsTemplate/smsTemplate";
    }

    @GetMapping("/category/{categoryId}/templates")
    @ResponseBody
    public ResponseEntity<List<SMSTemplateDTO>> getSMSTemplatesByCategory(@PathVariable String categoryId) {
        List<SMSTemplateDTO> templateDTOList = smsTemplateService.getSMSTemplatesByCategoryId(categoryId);
        return ResponseEntity.ok(templateDTOList);
    }

    @PostMapping("/category/template/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addTemplate(
            @RequestBody SmsTemplateRequest request) {
        smsTemplateService.addSmsTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template Added successfully");

        return ResponseEntity.ok(response);
    }

    @PostMapping("/category/template/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateTemplate(
            @RequestBody SmsTemplateRequest request) {
        smsTemplateService.updateSmsTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template updated successfully");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/category/template/delete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteTemplate(
            @RequestBody SmsTemplateRequest request) {
        smsTemplateService.deleteSmsTemplate(request);
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Template Deleted successfully");
        return ResponseEntity.ok(response);
    }
}
