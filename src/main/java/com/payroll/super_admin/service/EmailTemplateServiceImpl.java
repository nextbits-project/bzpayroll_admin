package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.EmailTemplateRequest;
import com.payroll.super_admin.dto.TemplateDTO;
import com.payroll.super_admin.entity.EmailCategory;
import com.payroll.super_admin.entity.EmailTemplate;
import com.payroll.super_admin.repo.EmailCategoryRepository;
import com.payroll.super_admin.repo.EmailTemplateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmailTemplateServiceImpl implements EmailTemplateService {

    private final EmailCategoryRepository categoryRepository;
    private final EmailTemplateRepository templateRepository;
    @Autowired
    EmailCategoryRepository emailCategoryRepository;

    public EmailTemplateServiceImpl(EmailCategoryRepository categoryRepository,
                                    EmailTemplateRepository templateRepository) {
        this.categoryRepository = categoryRepository;
        this.templateRepository = templateRepository;
    }

    @Override
    public List<CategoryDTO.CategoryInfo> getAllCategories() {
        return categoryRepository.findAll()
                .stream()
                .map(this::mapToDto)
                .collect(Collectors.toList());
    }

    // ----------- Private mapping helper -----------
    private CategoryDTO.CategoryInfo mapToDto(EmailCategory category) {
        CategoryDTO.CategoryInfo dto = new CategoryDTO.CategoryInfo();
        dto.setCode(category.getCode());
        dto.setId(category.getId());
        dto.setName(category.getName());
        return dto;
    }


    @Override
    @Transactional(readOnly = true)
    public List<TemplateDTO> getTemplatesByCategory(String categoryCode) {
        return templateRepository.findByCategoryCode(categoryCode).stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }
    @Override
    @Transactional(readOnly = true)
    public List<TemplateDTO> getTemplatesByCategoryId(Long categoryId) {
        return templateRepository.findByCategoryId(categoryId).stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public void addTemplate(EmailTemplateRequest request) {
        EmailTemplate emailTemplate = new EmailTemplate();
        EmailCategory emailCategory = emailCategoryRepository.findById(Long.parseLong(request.getCategoryId())).orElse(null);
        if (emailCategory != null)
            emailTemplate.setCategory(emailCategory);
        emailTemplate.setTitle(request.getTemplateName());
        emailTemplate.setSubject(request.getSubject());
        emailTemplate.setBody(request.getBody());
        templateRepository.save(emailTemplate);
    }

    @Override
    public void updateTemplate(EmailTemplateRequest request) {
        EmailTemplate emailTemplate = templateRepository.findById(Long.parseLong(request.getId())).orElse(null);
        if (emailTemplate != null){
            emailTemplate.setTitle(request.getTemplateName());
            emailTemplate.setSubject(request.getSubject());
            emailTemplate.setBody(request.getBody());
            templateRepository.save(emailTemplate);
        }
    }

    @Override
    public void deleteTemplate(EmailTemplateRequest request) {
        templateRepository.deleteById(Long.parseLong(request.getId()));
    }


    @Override
    @Transactional(readOnly = true)
    public TemplateDTO getTemplateById(Long id) {
        EmailTemplate template = templateRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Template not found with id: " + id));
        return mapToDTO(template);
    }

    private TemplateDTO mapToDTO(EmailTemplate template) {
        TemplateDTO dto = new TemplateDTO();
        dto.setId(template.getId());
        dto.setCategoryId(template.getCategory().getId());
        dto.setTitle(template.getTitle());  // or template.getTitle() depending on your entity
        dto.setSubject(template.getSubject());
        dto.setBody(template.getBody());
        return dto;
    }
}
