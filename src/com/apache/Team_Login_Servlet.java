package com.apache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 晨阳 on 2017/3/10.
 */
@WebServlet(name = "com.apache.Team_Login_Servlet")
public class Team_Login_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("gbk");
        String sql = "SELECT Team_Name,Password FROM team WHERE Team_Name = '"+request.getParameter("Team_Name")+"'";
        ResultSet resultSet = JDBCTools.Select(sql+"");
        try {
            resultSet.next();
            if(!request.getParameter("Password").equals(resultSet.getString("Password"))){
                PrintWriter pw = response.getWriter();
                pw.println("密码错误！");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/Team_Main_Menu.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
