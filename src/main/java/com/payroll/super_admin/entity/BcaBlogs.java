package com.payroll.super_admin.entity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "bca_blogs")
public class BcaBlogs {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private BcaBlogCategories category;

    @Column(nullable = false, length = 255)
    private String title;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(length = 500)
    private String shortDescription;

    @Lob
    @Column(columnDefinition = "LONGTEXT")
    private String description;

    private String featuredImage;

    private String metaTitle;

    @Column(length = 1000)
    private String metaKeywords;

    @Column(length = 1000)
    private String metaDescription;

    @Builder.Default
    private String author = "Admin";

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private BlogStatus status = BlogStatus.DRAFT;

    @Builder.Default
    private Integer views = 0;

    private LocalDate publishedAt;

    private LocalDateTime createdAt = LocalDateTime.now();

    private LocalDateTime updatedAt = LocalDateTime.now();

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
