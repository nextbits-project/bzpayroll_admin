package com.payroll.super_admin.dto;


import java.util.List;

public class CategoryDTO {

   private CategoryInfo category;  // Represents the category details
    private List<TemplateDTO> templates;  // List of templates under this category

    // Getters and Setters
    public CategoryInfo getCategory() {
        return category;
    }

    public void setCategory(CategoryInfo category) {
        this.category = category;
    }

    public List<TemplateDTO> getTemplates() {
        return templates;
    }

    public void setTemplates(List<TemplateDTO> templates) {
        this.templates = templates;
    }

    // Inner class to hold category info
    public static class CategoryInfo {
        private String code;
        private String name;
        private Long id;

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        } 
        

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

}

