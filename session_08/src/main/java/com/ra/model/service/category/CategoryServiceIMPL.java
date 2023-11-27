package com.ra.model.service.category;

import com.ra.model.dao.category.CategoryDAOimpl;
import com.ra.model.dao.category.CategoryDao;
import com.ra.model.entity.Category;

import java.util.List;

public class CategoryServiceIMPL implements CategoryService{
    private CategoryDao categoryDao= new CategoryDAOimpl();
    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        return categoryDao.saveOrUpdate(category);
    }

    @Override
    public Category findById(Integer integer) {
        for (Category category : categoryDao.findAll()) {
            if (category.getCategoryId() == integer) {
                return category;
            }
        }
        return null;
    }

    @Override
    public void delete(Integer integer) {

    }
}
