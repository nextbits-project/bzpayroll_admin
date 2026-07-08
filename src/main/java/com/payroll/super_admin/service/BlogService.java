package com.payroll.super_admin.service;

import com.payroll.super_admin.dto.BlogDto;
import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.BcaBlogs;
import com.payroll.super_admin.repo.BlogCategoryRepository;
import com.payroll.super_admin.repo.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class BlogService {
    @Autowired
    BlogRepository blogRepository;
    @Autowired
    BlogCategoryRepository blogCategoryRepository;

    @Value("${file.upload-dir}")
    private String uploadDir;
    @Value("${image.base-url}")
    private String baseURL;

    public void createBlog(BlogDto blogDto, MultipartFile image) throws IOException {
        BcaBlogs bcaBlogs = new BcaBlogs();

        if (image != null && !image.isEmpty()) {
            File folder = new File(uploadDir);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            String fileName = UUID.randomUUID() + "_" + image.getOriginalFilename();
            Path path = Paths.get(uploadDir, fileName);
            Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            bcaBlogs.setFeaturedImage(fileName);
        }

        if (blogDto.getTitle() != null){
            bcaBlogs.setTitle(blogDto.getTitle());
        }
        if (blogDto.getSlug() != null){
            bcaBlogs.setSlug(blogDto.getSlug());
        }
        if (blogDto.getShortDescription() != null){
            bcaBlogs.setShortDescription(blogDto.getShortDescription());
        }
        if (blogDto.getDescription() != null){
            bcaBlogs.setDescription(blogDto.getDescription());
        }
        if (blogDto.getMetaTitle() != null){
            bcaBlogs.setMetaTitle(blogDto.getMetaTitle());
        }
        if (blogDto.getMetaDescription() != null){
            bcaBlogs.setMetaDescription(blogDto.getMetaDescription());
        }
        if (blogDto.getMetaKeywords() != null){
            bcaBlogs.setMetaKeywords(blogDto.getMetaKeywords());
        }
        if (blogDto.getStatus() != null){
            bcaBlogs.setStatus(blogDto.getStatus());
        }
        if (blogDto.getPublishDate() != null){
            bcaBlogs.setPublishedAt(blogDto.getPublishDate());
        }

        BcaBlogCategories blogCategories = blogCategoryRepository.findById(Long.parseLong(blogDto.getCategoryId())).orElse(null);
        if (blogCategories != null){
            bcaBlogs.setCategory(blogCategories);
        }
        blogRepository.save(bcaBlogs);
    }

    public List<BcaBlogs> getAllBlog() {
        List<BcaBlogs> blogs = blogRepository.findAll();
        for (BcaBlogs blog : blogs) {
            if (blog.getFeaturedImage() != null && !blog.getFeaturedImage().isBlank()) {
                blog.setFeaturedImage(baseURL + blog.getFeaturedImage());
            }
        }
        return blogs;
    }

    public void deleteBlog(Long id) {
        blogRepository.deleteById(id);
    }

    public BcaBlogs getBlogById(String id) {
        BcaBlogs blog = blogRepository.findById(Long.parseLong(id)).orElse(null);
        assert blog != null;
        if (blog.getFeaturedImage() != null && !blog.getFeaturedImage().isBlank()) {
            blog.setFeaturedImage(baseURL + blog.getFeaturedImage());
        }
        return blog;
    }

    public void updateBlog(BlogDto blogDto, MultipartFile image) throws IOException {
        BcaBlogs bcaBlogs = blogRepository.findById(blogDto.getId())
                .orElseThrow(() -> new RuntimeException("Blog not found"));

        if (image != null && !image.isEmpty()) {
            File folder = new File(uploadDir);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            String fileName = UUID.randomUUID() + "_" + image.getOriginalFilename();
            Path path = Paths.get(uploadDir, fileName);
            Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            bcaBlogs.setFeaturedImage(fileName);
        }

        if (blogDto.getTitle() != null){
            bcaBlogs.setTitle(blogDto.getTitle());
        }
        if (blogDto.getSlug() != null){
            bcaBlogs.setSlug(blogDto.getSlug());
        }
        if (blogDto.getShortDescription() != null){
            bcaBlogs.setShortDescription(blogDto.getShortDescription());
        }
        if (blogDto.getDescription() != null){
            bcaBlogs.setDescription(blogDto.getDescription());
        }
        if (blogDto.getMetaTitle() != null){
            bcaBlogs.setMetaTitle(blogDto.getMetaTitle());
        }
        if (blogDto.getMetaDescription() != null){
            bcaBlogs.setMetaDescription(blogDto.getMetaDescription());
        }
        if (blogDto.getMetaKeywords() != null){
            bcaBlogs.setMetaKeywords(blogDto.getMetaKeywords());
        }
        if (blogDto.getStatus() != null){
            bcaBlogs.setStatus(blogDto.getStatus());
        }
        if (blogDto.getPublishDate() != null){
            bcaBlogs.setPublishedAt(blogDto.getPublishDate());
        }

        BcaBlogCategories blogCategories = blogCategoryRepository.findById(Long.parseLong(blogDto.getCategoryId())).orElse(null);
        if (blogCategories != null){
            bcaBlogs.setCategory(blogCategories);
        }
        blogRepository.save(bcaBlogs);
    }
}
