package com.example.session_07;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "userList",value = "/userList")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = new ArrayList<>();

        userList.add(new User("Thịnh","11/11/2000","nghệ an",""));
        userList.add(new User("Huy","11/11/2000","Hà Nội",""));
        userList.add(new User("Đức","11/11/2000","Hà Nội",""));
        userList.add(new User("Sơn","11/11/2000","Hà Nội",""));

        req.setAttribute("userList",userList);
        req.getRequestDispatcher("listUser.jsp").forward(req,resp);
    }
}
