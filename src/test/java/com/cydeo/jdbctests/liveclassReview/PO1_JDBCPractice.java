package com.cydeo.jdbctests.liveclassReview;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class PO1_JDBCPractice {

    //connection string
    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public  void test1() throws SQLException {

        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword); //alt+enter assign it
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES");

        /*
         retrieve data
         */




        rs.close();
        statement.close();
        connection.close();

    }
}
