package com.ra.model.entity;

public class Category {
    private int CategoryId;
    private String CategoryName;
    private boolean CategoryStatus;

    public Category() {
    }

    public Category(int categoryId, String categoryName, boolean categoryStatus) {
        CategoryId = categoryId;
        CategoryName = categoryName;
        CategoryStatus = categoryStatus;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int categoryId) {
        CategoryId = categoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }

    public boolean isCategoryStatus() {
        return CategoryStatus;
    }

    public void setCategoryStatus(boolean categoryStatus) {
        CategoryStatus = categoryStatus;
    }
}
