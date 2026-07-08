package com.payroll.super_admin.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "bca_blog_categories")
public class BcaBlogCategories {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String categoryName;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(nullable = false)
    private Boolean status = true;

    private LocalDateTime createdAt = LocalDateTime.now();

    @OneToMany(mappedBy = "category")
    @JsonIgnore
	private Set<BcaBlogs> blogs;
}
