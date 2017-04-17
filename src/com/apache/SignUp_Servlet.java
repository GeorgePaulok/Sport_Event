package com.apache;

import com.mysql.jdbc.PreparedStatement;
import com.apache.JDBCTools;
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
 * Created by 晨阳 on 2017/3/12.
 */
@WebServlet(name = "SignUp_Servlet")
public class SignUp_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String temp_team_name = request.getParameter("team_name");
        String team_name = new String(temp_team_name.getBytes("ISO-8859-1"),"utf-8");
        ResultSet resultSet = JDBCTools.Select("SELECT * FROM player_basic_info WHERE Team_Name='"+team_name+"'");
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet set = JDBCTools.Select("SELECT * FROM sport_event");
        String Sports_Event = null;
        try {
            while(set.next()){
                if(set.getString(2).equals("1")){
                    Sports_Event = set.getString(1);
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int counter = 1;
        try {
            while(resultSet.next()){
                String register_status = request.getParameter("p"+counter+"Register_Status");
                if(register_status.equals("yes")){
                    try {
                        connection = JDBCTools.GetConnection();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    String s = "INSERT INTO test.player_info (Team_name,Player_Name, Sex, Height, Weight, ID,Player_Add,Event_Group,Event1, Event2, Event3, Event4, Event5, Sport_Event_Name, Player_Number, Player_Photo) "+
                            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    ps = (PreparedStatement) connection.prepareStatement(s);
                    request.setCharacterEncoding("utf-8");
                    ps.setString(1, team_name);
                    ps.setString(2, resultSet.getString("Player_Name"));
                    ps.setString(3, resultSet.getString("Sex"));
                    ps.setString(4, resultSet.getString("Height"));
                    ps.setString(5, resultSet.getString("Weight"));
                    ps.setString(6, resultSet.getString("ID"));
                    ps.setString(7, resultSet.getString("Player_Add"));
                    ps.setString(8, request.getParameter("p"+counter+"Group"));
                    ps.setString(9, request.getParameter("p"+counter+"Event1"));
                    ps.setString(10, request.getParameter("p"+counter+"Event2"));
                    ps.setString(11, request.getParameter("p"+counter+"Event3"));
                    ps.setString(12, request.getParameter("p"+counter+"Event4"));
                    ps.setString(13, request.getParameter("p"+counter+"Event5"));
                    ps.setString(14, resultSet.getString("Sports_Event"));
                    ps.setString(15, resultSet.getString("Player_Number"));
                    ps.setString(16, resultSet.getString("Player_Photo"));
                    ps.executeUpdate();
                    JDBCTools.ReleaseDB(null, ps, connection);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
