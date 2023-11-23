package com.example.session_07;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "CalculatorServlet",value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //lấy tham số
        int firstOperand = Integer.parseInt(req.getParameter("firstOperand"));
        int secondOperand = Integer.parseInt(req.getParameter("secondOperand"));
        String operator = req.getParameter("operator");

        //thực hiện tính
        int result = 0;
        String errorMessage = null;

        if (operator.equals("add")) {
            result = firstOperand + secondOperand;
        }else if (operator.equals("subtract")) {
            result = firstOperand - secondOperand;
        }else if (operator.equals("multiply")) {
            result = firstOperand * secondOperand;
        }else if (operator.equals("divide")) {
            if (secondOperand!=0){
                result = firstOperand / secondOperand;
            }else {
                errorMessage="không chia được cho 0";
            }
        }
        req.setAttribute("result", result);
        req.setAttribute("errorMessage", errorMessage);

        req.getRequestDispatcher("result.jsp").forward(req,resp);
    }
}
