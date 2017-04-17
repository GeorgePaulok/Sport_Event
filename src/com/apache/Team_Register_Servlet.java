package com.apache;

import javax.servlet.annotation.WebServlet;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import com.mysql.jdbc.PreparedStatement;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Created by 晨阳 on 2017/3/5.
 */
@WebServlet(name = "Team_Register_Servlet")
public class Team_Register_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("gbk");
        String password = request.getParameter("password");
        String password_confirm = request.getParameter("password_confirm");
        PrintWriter pw = response.getWriter();
        if(!password.equals(password_confirm)){
            pw.println("两次填写的密码不一致！请返回重新填写。");
            return;
        }
        ResultSet resultSet = JDBCTools.Select("SELECT * FROM sport_event");
        String Sports_Event = null;
        try {
            while(resultSet.next()){
                if(resultSet.getString("Status").equals("1")){
                    Sports_Event = resultSet.getString(1);
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        PreparedStatement ps = null;

        try {
            connection = JDBCTools.GetConnection();
            String s = "INSERT INTO test.team (Team_Name, Commander, Leader, Coach, Staff, Doctor, Contact, No, Sport_Event_Name,Password)"+
                    "VALUES (?,?,?,?,?,?,?,?,?,?)";
            ps = (PreparedStatement) connection.prepareStatement(s);
            ps.setString(1,request.getParameter("team_name"));
            ps.setString(2,request.getParameter("commander"));
            ps.setString(3,request.getParameter("leader"));
            ps.setString(4,request.getParameter("coach"));
            ps.setString(5,request.getParameter("staff"));
            ps.setString(6,request.getParameter("doctor"));
            ps.setString(7,request.getParameter("contact"));
            ps.setString(8,"1");
            ps.setString(9,Sports_Event);
            ps.setString(10,request.getParameter("password"));
            ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCTools.ReleaseDB(null, ps, connection);
        }
        response.getWriter().println("注册成功！");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
