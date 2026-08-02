package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.CategoryTemplateRequest;

public interface CategoryTemplateService {
    void addTemplate(CategoryTemplateRequest request);
    void updateTemplate(CategoryTemplateRequest request);
    void deleteTemplate(Long id);
}
