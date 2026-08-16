package com.payroll.super_admin.entity;

import jakarta.persistence.*;

@Entity
@Table(name= "bca_smstemplate")
public class BcaSmsTemplate {

    @Id
    @Column(name= "TemplateID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer templateId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", nullable = false)
    private EmailCategory category;

    @Column(name= "TemplateName")
    private String templateName;

    @Column(name= "MessageContent", columnDefinition = "longtext")
    private String messageContent;

    @Column(name= "Module")
    private String module;

    @Column(name= "Active")
    private Integer active;

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public EmailCategory getCategory() {
        return category;
    }

    public void setCategory(EmailCategory category) {
        this.category = category;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }
}
