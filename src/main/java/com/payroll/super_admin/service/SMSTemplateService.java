package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.SMSTemplateDTO;
import com.payroll.super_admin.dto.SmsTemplateRequest;

import java.util.List;

public interface SMSTemplateService {
    List<SMSTemplateDTO> getSMSTemplatesByCategoryId(String categoryId);
    void addSmsTemplate(SmsTemplateRequest request);
    void updateSmsTemplate(SmsTemplateRequest request);
    void deleteSmsTemplate(SmsTemplateRequest request);
}
