package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.CategoryDTO;
import com.payroll.super_admin.dto.TemplateDTO;
import com.payroll.super_admin.entity.EmailCategory;
import com.payroll.super_admin.entity.EmailTemplate;
import com.payroll.super_admin.repo.EmailCategoryRepository;
import com.payroll.super_admin.repo.EmailTemplateRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EmailTemplateServiceImpl implements EmailTemplateService {

    private final EmailCategoryRepository categoryRepository;
    private final EmailTemplateRepository templateRepository;

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
    @Transactional(readOnly = true)
    public TemplateDTO getTemplateById(Long id) {
        EmailTemplate template = templateRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Template not found with id: " + id));
        return mapToDTO(template);
    }

    private TemplateDTO mapToDTO(EmailTemplate template) {
        TemplateDTO dto = new TemplateDTO();
        dto.setTitle(template.getTitle());  // or template.getTitle() depending on your entity
        dto.setSubject(template.getSubject());
        dto.setBody(template.getBody());
        return dto;
    }
}
