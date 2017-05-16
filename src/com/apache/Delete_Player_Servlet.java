package com.apache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 晨阳 on 2017/3/10.
 */
@WebServlet(name = "Delete_Player_Servlet")
public class Delete_Player_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String player_name = request.getParameter("player_name");
        System.out.println(player_name);
        JDBCTools.Update("DELETE FROM player_basic_info WHERE Player_Name = '"+player_name+"'");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
