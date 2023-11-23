package com.example.controller;

import com.example.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "studentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private List<Student> students = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        students.add(new Student("B11", "Nguyễn Văn A", "Hà Nội", 20, "JV0630", true));
        students.add(new Student("B12", "Nguyễn Văn B", "Hà Nội", 20, "JV0630", false));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // lấy về action
        String action = req.getParameter("action");

        if (action == null) {
            req.setAttribute("students", students);
            req.getRequestDispatcher("views/student.jsp").forward(req, resp);
        }
        switch (action) {
            case "add":
                //điều hướng về add
                resp.sendRedirect("views/add-student.jsp");
                break;
            case "edit":
                //lấy về id
                String studentEdit = req.getParameter("id");
                Student student = findById((studentEdit));
                req.setAttribute("student", student);
                req.getRequestDispatcher("views/edit-student.jsp").forward(req, resp);

                resp.sendRedirect("views/edit-student.jsp");
                break;
            case "delete":
                String studentDelete = req.getParameter("id");
                Student studentToDelete = findById(studentDelete);
                if (studentToDelete != null) {
                    students.remove(studentToDelete);
                }
                req.setAttribute("students", students);
                req.getRequestDispatcher("views/student.jsp").forward(req, resp);
                resp.sendRedirect("views/student.jsp");
            default:
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        Student newStudent = new Student();
        newStudent.setStudentCode(req.getParameter("studentCode"));
        newStudent.setStudentName(req.getParameter("studentName"));
        newStudent.setAge(Integer.parseInt(req.getParameter("age")));
        newStudent.setAddress(req.getParameter("address"));
        newStudent.setSex(Boolean.parseBoolean(req.getParameter("sex")));
        newStudent.setClassRoom(req.getParameter("classRoom"));
        if (action == null) {
            students.add(newStudent);
            req.setAttribute("students", students);
            req.getRequestDispatcher("views/student.jsp").forward(req, resp);
        }else {
            Student studentID= findById(req.getParameter("studentCode"));
            studentID.setStudentName(req.getParameter("studentName"));
            studentID.setAge(Integer.parseInt(req.getParameter("age")));
            studentID.setAddress(req.getParameter("address"));
            studentID.setSex(Boolean.parseBoolean(req.getParameter("sex")));
            studentID.setClassRoom(req.getParameter("classRoom"));

            req.setAttribute("students", students);
            req.getRequestDispatcher("views/student.jsp").forward(req, resp);
        }

    }

    private Student findById(String id) {
        for (Student student : students) {
            if (student.getStudentCode().equals(id)) {
                return student;
            }
        }
        return null;
    }
}
