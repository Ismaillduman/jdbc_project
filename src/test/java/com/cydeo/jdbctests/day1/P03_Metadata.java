package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_Metadata {
    //Connection string

    String dbUrl="jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName="hr";
    String dbPassword="hr";
    @Test
    public void task1() throws SQLException {
        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select * FROM EMPLOYEES");

        //DatabaseMetadata
        DatabaseMetaData dbMetaData = connection.getMetaData();

        System.out.println(dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverVersion());

        //resultsetmetadata

        ResultSetMetaData rsmd = rs.getMetaData();

        //how many columns we have
        System.out.println(rsmd.getColumnCount());

        //get me the columns name for index 2

        System.out.println(rsmd.getColumnName(1));


    }
}
