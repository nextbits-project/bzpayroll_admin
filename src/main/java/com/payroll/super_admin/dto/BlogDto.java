package com.payroll.super_admin.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.BlogStatus;
import lombok.Data;

import java.time.LocalDate;

@Data
public class BlogDto {
    private Long id;
    private String categoryId;
    private String title;
    private String slug;
    private String shortDescription;
    private String description;
    private String featuredImage;
    private String metaTitle;
    private String metaKeywords;
    private String metaDescription;
    private BlogStatus status;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate publishDate;
}
