package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.CategoryTemplateRequest;
import com.payroll.super_admin.entity.EmailCategory;
import com.payroll.super_admin.repo.EmailCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryTemplateServiceImpl implements CategoryTemplateService {
    @Autowired
    private EmailCategoryRepository categoryRepository;

    @Override
    public void addTemplate(CategoryTemplateRequest request) {
        EmailCategory emailCategory = new EmailCategory();
        emailCategory.setName(request.getName());
        emailCategory.setCode(request.getCode());
        categoryRepository.save(emailCategory);
    }

    @Override
    public void updateTemplate(CategoryTemplateRequest request) {
        EmailCategory emailCategory = categoryRepository.findById(Long.parseLong(request.getId())).orElse(null);
        if (emailCategory != null){
            emailCategory.setName(request.getName());
            emailCategory.setCode(request.getCode());
            categoryRepository.save(emailCategory);
        }
    }

    @Override
    public void deleteTemplate(Long id) {
        categoryRepository.deleteById(id);
    }
}
