package com.cydeo.jdbctests.liveclassReview;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class PO1_JDBCPractice {

    //connection string
    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public void test1() throws SQLException {

        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword); //alt+enter assign it
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("SELECT * FROM countries");

        /*
         retrieve data
         */
        System.out.println("FIRST ROW");
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println("second row");
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println("10th row");
        rs.absolute(10);
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println(" \uD83D\uDE00  how many row we have");
        System.out.println(rs.getRow());


        rs.last(); //jump to last and getRow the count
        int rowCount = rs.getRow();
        System.out.println("rowCount = " + rowCount);

        System.out.println("get previous row info");
        rs.previous();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        System.out.println("  \uD83D\uDE80  print all data dynamically");
        rs.beforeFirst();
        while (rs.next()) {
            System.out.println(rs.getString(1) + " - " + rs.getString(2));
        }


        // what we have more than 2 row
        System.out.println(" \uD83E\uDD18\uD83C\uDFFB print all column name dynamically  \uD83C\uDF89\uD83C\uDF84");
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();

        for (int i = 1; i <= columnCount; i++) {
            System.out.println(rsmd.getColumnName(i));
        }
        System.out.println("" +
                " \uD83D\uDCA1\uD83E\uDDE0\uD83D\uDCAD print all data dynamically  \uD83C\uDF89\uD83C\uDF84");

        rs.beforeFirst();
        while (rs.next()){
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i) + " - " +rs.getString(i)+" ");
            }
            System.out.println("\uD83D\uDCA1\uD83E\uDDE0\uD83D\uDCAD");}
        rs.close();
        statement.close();
        connection.close();

    }
}
