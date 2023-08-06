package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {

        //connection string
        String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
        String dbUserName = "hr";
        String dbPassword = "hr";

        //create the connection
        //driver manager class getConnection Method will help to connect database
        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

        //It will help us to execute query
        Statement statement = connection.createStatement();


        //result set will store data after execution. I store only data(there is no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS");


//        //getting data
//        rs.next();
//        System.out.println("-------------------------------FIRST ROW----------------------");
//        //right now pointer is in the first row
//
//        //how to get data from first row
//        //rs.getInt(index)  --> this method returns integer. Index start from 1 in SQL.It refers column
//        //position
//        System.out.println(rs.getInt(1));
//        //get the Europe region name
//        System.out.println(rs.getString(2));
//
//        //same info we can get with columnLabel not columnIndex
//        System.out.println(rs.getInt("REGION_ID"));
//        System.out.println(rs.getString("REGION_NAME"));
//
//        //get me second row result in following format: 2 - Americas
//        System.out.println("-------------------------------SECOND ROW----------------------");
//        rs.next();
//        System.out.println(rs.getInt(1)+" - "+rs.getString(2));
//        System.out.println("-------------------------------THIRD ROW----------------------");
//        rs.next();
//        System.out.println(rs.getInt(1)+" - "+rs.getString(2));
//        System.out.println("-------------------------------4TH ROW----------------------");
//        rs.next();
//        System.out.println(rs.getInt(1)+" - "+rs.getString(2));

        while (rs.next()){
            System.out.println(rs.getInt(1)+" - "+rs.getString(2)+" - "+rs.getString(3));
        }


        //close connection
        rs.close();
        statement.close();
        connection.close();

    }
}
