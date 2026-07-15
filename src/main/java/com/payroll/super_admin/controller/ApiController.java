package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.BcaBlogs;
import com.payroll.super_admin.service.BlogService;
import com.payroll.super_admin.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping(value = "/api")
public class ApiController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    BlogService blogService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @GetMapping("/category")
    public List<BcaBlogCategories> getAllCategory() {
        return categoryService.getAllCategory();
    }

    @DeleteMapping("/category/{id}")
    public void deleteCategory(@PathVariable("id") Long id) {
        categoryService.deleteCategory(id);
    }

    @GetMapping("/blog")
    public List<BcaBlogs> getAllBlog() {
        return blogService.getAllBlog();
    }

    @GetMapping("/images/{fileName:.+}")
    public ResponseEntity<Resource> getImage(@PathVariable String fileName) throws IOException {

        Path path = Paths.get(uploadDir).resolve(fileName);

        Resource resource = new UrlResource(path.toUri());

        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        String contentType = Files.probeContentType(path);

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(
                        contentType != null ? contentType : "application/octet-stream"))
                .body(resource);
    }
    @DeleteMapping("/blog/{id}")
    public void deleteBlog(@PathVariable("id") Long id) {
        blogService.deleteBlog(id);
    }

}
