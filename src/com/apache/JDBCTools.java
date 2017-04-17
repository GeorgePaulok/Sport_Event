package com.apache; /**
 * Created by 晨阳 on 2017/3/1.
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Driver;
import java.util.HashMap;
import java.util.Map;
import java.sql.ResultSetMetaData;

public class JDBCTools {
    public static <T> T Select(Class<T> clazz, String sql, Object... objects) {
        T entity = null;
        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            Map<String, Object> values = new HashMap<String, Object>();
            connection = JDBCTools.GetConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < objects.length; i++) {
                preparedStatement.setObject(i + 1, objects[i]);
            }
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();
            while(resultSet.next()){
                for (int i = 0; i < rsmd.getColumnCount(); i++) {
                    String columnlable = rsmd.getColumnLabel(i + 1);
                    Object columnvalue = resultSet.getObject(columnlable);
                    values.put(columnlable, columnvalue);
                }
            }
            System.out.println(values);
            if(values.size()>0){
                entity=clazz.newInstance();
                for (Map.Entry<String, Object> entry : values.entrySet()) {
                    String filedName=entry.getKey();
                    Object filedValue=entry.getValue();
                    //				Reflection.setObject(entity, filedName,filedValue);
                }
                System.out.println(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.ReleaseDB(resultSet, preparedStatement, connection);
        }
        return entity;
    }

	public static ResultSet Select(String sql) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = JDBCTools.GetConnection();
			// 3、获取statement对象
			statement = connection.createStatement();
			// 4、调用操作
			resultSet = statement.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//JDBCTools.ReleaseDB(null, statement, connection);
			return resultSet;
		}
	}

    // 修改，添加，删除
    public static void Update(String sql, Object... objects) {
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = JDBCTools.GetConnection();
            ps = connection.prepareStatement(sql);
            for (int i = 0; i < objects.length; i++) {
                ps.setObject(i + 1, objects[i]);
            }
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.ReleaseDB(null, ps, connection);
        }
    }

    public static void Update(String sql) {
        Connection connection = null;
        Statement statement = null;
        try {
            connection = JDBCTools.GetConnection();
            // 3、获取statement对象
            statement = connection.createStatement();
            // 4、调用操作
            statement.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTools.ReleaseDB(null, statement, connection);
        }
    }

    public static void ReleaseDB(ResultSet rs, Statement statement, Connection connection) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }

    public static Connection GetConnection() throws IOException, ClassNotFoundException, SQLException {
        Driver driver = new com.mysql.jdbc.Driver();
        DriverManager.registerDriver(driver);
        String driverClass = "com.mysql.jdbc.Driver";
        String JDBCUrl = "jdbc:mysql://localhost:3306/test?useUnicode=true&amp;characterEncoding=utf-8";
        String user = "root";
        String password = "123456";
        Class.forName(driverClass);
        return DriverManager.getConnection(JDBCUrl, user, password);
    }
}
