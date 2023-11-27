package com.ra.controler;

import com.ra.model.entity.Category;
import com.ra.model.service.category.CategoryService;
import com.ra.model.service.category.CategoryServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControler", value = "/danh-muc")
public class CategoryControler extends HttpServlet {

    private CategoryService categoryService = new CategoryServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            showListCategory(request, response);
        }
        switch (action) {
            case "add":
                addCategory(request, response);
                break;
            case "edit":
                editCategory(request, response);
                break;
            case "delete":
                break;

        }
    }

    public void addCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("views/addCategory.jsp");
    }

    public void editCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.findById(categoryId);
        request.setAttribute("list", category);
        response.sendRedirect("views/editCategory.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        Category category = new Category();
        category.setCategoryName(request.getParameter("categoryName"));
        category.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
        if (action == null) {
            if (categoryService.saveOrUpdate(category)) {
                showListCategory(request, response);
            }
            response.sendRedirect("views/category.jsp?err");
        }else {
            Category newCategory = categoryService.findById(Integer.valueOf(request.getParameter("id")));
            newCategory.setCategoryName(request.getParameter("categoryName"));
            newCategory.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
            showListCategory(request, response);
        }
    }

    public void showListCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> list = categoryService.findAll();
        request.setAttribute("list", list);
        request.getRequestDispatcher("views/category.jsp").forward(request, response);
    }
}