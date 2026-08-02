package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.EmailTemplateRequest;
import com.payroll.super_admin.dto.TemplateDTO;

import java.util.List;

public interface EmailTemplateService {

    List<CategoryDTO.CategoryInfo> getAllCategories();
    List<TemplateDTO> getTemplatesByCategory(String categoryCode);

    TemplateDTO getTemplateById(Long id);
    
    List<TemplateDTO> getTemplatesByCategoryId(Long categoryCode);
    void updateTemplate(EmailTemplateRequest request);

    void addTemplate(EmailTemplateRequest request);

    void deleteTemplate(EmailTemplateRequest request);
}