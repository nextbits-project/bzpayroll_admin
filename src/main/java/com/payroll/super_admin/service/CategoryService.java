package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.Customer;
import com.payroll.super_admin.repo.BlogCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class CategoryService {
    @Autowired
    BlogCategoryRepository blogCategoryRepository;

    public void createCategory(BcaBlogCategories blogCategories) {
        blogCategoryRepository.save(blogCategories);
    }

    public List<BcaBlogCategories> getAllCategory() {
        return blogCategoryRepository.findAll();
    }

    public void deleteCategory(Long id) {
        blogCategoryRepository.deleteById(id);
    }
    @Transactional
    public BcaBlogCategories updateCategory(Long id, BcaBlogCategories blogCategories) {
        BcaBlogCategories bcaBlogCategories = blogCategoryRepository.findById(id).orElseThrow(null);
        if (bcaBlogCategories != null){
            bcaBlogCategories.setCategoryName(blogCategories.getCategoryName());
            bcaBlogCategories.setSlug(blogCategories.getSlug());
            return blogCategoryRepository.save(bcaBlogCategories);
        }
        return null;
    }
}
