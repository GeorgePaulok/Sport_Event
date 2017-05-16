package com.apache;
/**
 * Created by 晨阳 on 2017/2/28.
 */

import java.io.*;
import javax.servlet.ServletException;
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

public class Servlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;
    private static int Player_Number = 0;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = JDBCTools.GetConnection();
            String s = "INSERT INTO test.player_basic_info (Team_Name, Player_Name, Sex, Height, Weight, ID, Player_Add, Class1,Class2,Class3,Player_Number,Player_Photo)"+
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = (PreparedStatement) connection.prepareStatement(s);
            request.setCharacterEncoding("utf-8");
            String team_name = request.getParameter("team_name");
            ps.setString(1,team_name);
//            ps.setString(1, request.getParameter("team_name"));
//            ps.setString(2, request.getParameter("name"));
//            ps.setString(3, request.getParameter("sex"));
//            ps.setString(4, request.getParameter("height"));
//            ps.setString(5, request.getParameter("weight"));
//            ps.setString(6, request.getParameter("id"));
//            ps.setString(7, request.getParameter("add"));
//            ps.setString(8, request.getParameter("event1"));
//            ps.setString(9, request.getParameter("event2"));
//            ps.setString(10, request.getParameter("event3"));
//            ps.setString(11, request.getParameter("event4"));
//            ps.setString(12, request.getParameter("event5"));

            //获得磁盘文件条目工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //获取文件需要上传到的路径
            String path = "E:/picture";

            //如果没以下两行设置的话，上传大的 文件 会占用 很多内存，
            //设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同
            /**
             * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上，
             * 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的
             * 然后再将其真正写到 对应目录的硬盘上
             */
            factory.setRepository(new File(path));
            //设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
            factory.setSizeThreshold(1024 * 1024);

            //高水平的API文件上传处理
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("utf-8");
            int i = 2;
            String filename = null;
            //可以上传多个文件
            List<FileItem> list = (List<FileItem>) upload.parseRequest(request);

            for (FileItem item : list) {
                //获取表单的属性名字
                String name = item.getFieldName();

                //如果获取的 表单信息是普通的 文本 信息
                if (item.isFormField()) {
                    //获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的
                    String value = item.getString("utf-8");
                    ps.setString(i + 0, value);
                    i++;
                }
                //对传入的非 简单的字符串进行处理 ，比如说二进制的 图片，电影这些
                else {
                    filename = Player_Number+".png";

                    request.setAttribute(name, filename);

                    //真正写到磁盘上
                    //它抛出的异常 用exception 捕捉

                    //item.write( new File(path,filename) );//第三方提供的

                    //手动写的
                    OutputStream out = new FileOutputStream(new File(path, filename));

                    InputStream in = item.getInputStream();

                    int length = 0;
                    byte[] buf = new byte[1024];

                    System.out.println("获取上传文件的总共的容量：" + item.getSize());

                    // in.read(buf) 每次读到的数据存放在   buf 数组中
                    while ((length = in.read(buf)) != -1) {
                        //在   buf 数组中 取出数据 写到 （输出流）磁盘上
                        out.write(buf, 0, length);
                    }
                    in.close();
                    out.close();
                }
            }
            ps.setString(11, ""+Player_Number); Player_Number++;
            ps.setString(12, path+"/"+filename);
            ps.executeUpdate();
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.ReleaseDB(null, ps, connection);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
