package com.apache;

import com.mysql.jdbc.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Created by 晨阳 on 2017/3/5.
 */
@WebServlet(name = "Event_Add_Servlet")
public class Event_Add_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Sports_Event = null;
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet resultSet = JDBCTools.Select("SELECT * FROM sport_event");
        try {
            while(resultSet.next()){
                if(resultSet.getString(2).equals("1")){
                    Sports_Event = resultSet.getString(1);
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            connection = JDBCTools.GetConnection();
            String s = "INSERT INTO test.event (Event_Name,Sport_Event_Name) VALUES(?,?)";
            ps = (PreparedStatement) connection.prepareStatement(s);
            request.setCharacterEncoding("utf-8");
            String event = request.getParameter("event");
            ps.setString(1,event);
            ps.setString(2,Sports_Event);
            ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
