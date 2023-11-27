package com.ra.model.service.category;

import com.ra.model.dao.category.CategoryDAO;
import com.ra.model.dao.category.CategoryDAOimpl;
import com.ra.model.entity.Category;

import java.util.List;

public class CategoryServiceIMPL implements CategoryService {
    private final CategoryDAO categoryDao = new CategoryDAOimpl();

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public boolean saveOrUpdate(Category category, Integer integer) {
        return categoryDao.saveOrUpdate(category, integer);
    }

    @Override
    public Category findById(Integer integer) {
        return categoryDao.findById(integer);
    }

    @Override
    public void delete(Integer integer) {
        categoryDao.delete(integer);
    }

    @Override
    public int getNewId() {
        return 0;
    }

    @Override
    public List<Category> finByName(String name) {
        return null;
    }
}
