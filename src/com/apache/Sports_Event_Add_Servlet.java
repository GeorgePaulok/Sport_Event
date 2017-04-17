package com.apache;

import com.mysql.jdbc.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by 晨阳 on 2017/3/5.
 */
@WebServlet(name = "Sports_Event_Add_Servlet")
public class Sports_Event_Add_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JDBCTools.Update("UPDATE test.sport_event SET Status = 0");
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = JDBCTools.GetConnection();
            String s = "INSERT INTO test.sport_event (Sport_Event_Name,Status) VALUES(?,?)";
            ps = (PreparedStatement) connection.prepareStatement(s);
            request.setCharacterEncoding("utf-8");
            String Sport_Event = request.getParameter("sports_event");
            ps.setString(1,Sport_Event);
            ps.setString(2,"1");
            ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
