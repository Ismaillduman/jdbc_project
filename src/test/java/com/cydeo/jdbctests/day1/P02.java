package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02 {
    //connection string
    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public void test1() throws SQLException {


        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

        //It will help us to execute query
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


        //result set will store data after execution. I store only data(there is no table info)
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");
        rs.next();
        System.out.println(rs.getInt(1) + " - " + rs.getString(3));

        rs.next();
        System.out.println(rs.getInt(1) + " - " + rs.getString(3));

        rs.last();
        System.out.println(rs.getInt(1) + " - " + rs.getString(3));
        System.out.println(rs.getRow());

        System.out.println("-----------ABSOLUTE-----------");
                rs.absolute(46);
        System.out.println(rs.getString(1) + " " + rs.getString(2));


        System.out.println("----------PREVIOUS------------------");

        rs.previous();
        System.out.println(rs.getString(1)+" - "+rs.getString(2));

        //print the whole table
        System.out.println("---------------whole table---------------");
        //rs.absolute(0);
        //rs.first();
        rs.beforeFirst();
        while(rs.next()) {
            System.out.println(rs.getString(1) + " " + rs.getString(2));
        }
        //close connection
        rs.close();
        statement.close();
        connection.close();
    }
}
