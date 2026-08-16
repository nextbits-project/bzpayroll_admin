package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.SMSTemplateDTO;
import com.payroll.super_admin.dto.SmsTemplateRequest;
import com.payroll.super_admin.entity.BcaSmsTemplate;
import com.payroll.super_admin.entity.EmailCategory;
import com.payroll.super_admin.repo.BcaSmsTemplateRepository;
import com.payroll.super_admin.repo.EmailCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SMSTemplateServiceImpl implements SMSTemplateService {

    @Autowired
    private BcaSmsTemplateRepository smsTemplateRepository;
    @Autowired
    EmailCategoryRepository emailCategoryRepository;

    @Override
    public List<SMSTemplateDTO> getSMSTemplatesByCategoryId(String categoryId) {
        return smsTemplateRepository.findByCategoryId(Long.parseLong(categoryId)).stream()
                .map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public void addSmsTemplate(SmsTemplateRequest request) {
        BcaSmsTemplate bcaSmstemplate = new BcaSmsTemplate();
        EmailCategory emailCategory = emailCategoryRepository.findById(Long.parseLong(request.getCategoryId())).orElse(null);
        if (emailCategory != null)
            bcaSmstemplate.setCategory(emailCategory);
        bcaSmstemplate.setTemplateName(request.getTemplateName());
        bcaSmstemplate.setModule(request.getModule());
        bcaSmstemplate.setMessageContent(request.getMessageContent());
        smsTemplateRepository.save(bcaSmstemplate);
    }

    @Override
    public void updateSmsTemplate(SmsTemplateRequest request) {
        BcaSmsTemplate bcaSmstemplate = smsTemplateRepository.findById(Integer.parseInt(request.getId())).orElse(null);
        if (bcaSmstemplate != null){
            bcaSmstemplate.setTemplateName(request.getTemplateName());
            bcaSmstemplate.setModule(request.getModule());
            bcaSmstemplate.setMessageContent(request.getMessageContent());
            smsTemplateRepository.save(bcaSmstemplate);
        }
    }

    @Override
    public void deleteSmsTemplate(SmsTemplateRequest request) {
        smsTemplateRepository.deleteById(Integer.parseInt(request.getId()));
    }

    private SMSTemplateDTO mapToDTO(BcaSmsTemplate template) {
        SMSTemplateDTO dto = new SMSTemplateDTO();
        dto.setId(template.getTemplateId());
        dto.setCategoryId(template.getCategory().getId());
        dto.setTemplateName(template.getTemplateName());
        dto.setMessageContent(template.getMessageContent());
        dto.setModule(template.getModule());
        return dto;
    }
}
