package com.cydeo.jdbctests.day1;

import com.sun.source.tree.WhileLoopTree;
import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {
    //connection string
    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public void test1() throws SQLException {

        //create the connection
        //driver manager class getConnection Method will help to connect database
        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

        //It will help us to execute query
        Statement statement = connection.createStatement();


        //result set will store data after execution. I store only data(there is no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS where Manager_ID is not null");

        //10-Administration-200-1700
//        for (int i = 0; i < 4; i++) {
//            rs.next();
//            System.out.println(rs.getInt(1) + " - " + rs.getString(2) + " - " +
//                    rs.getString(3) + " - " + rs.getString(4));
//        }

        //1297 Via Cola di Rie - Roma
        rs = statement.executeQuery("select * from LOCATIONS");

        while (rs.next()) {
            if (rs.getString(2).equals("1297 Via Cola di Rie")) {
                System.out.println(rs.getString(2) + " - " + rs.getString(4));
                break;
            }

        }



        //close connection
        rs.close();
        statement.close();
        connection.close();
    }

}
