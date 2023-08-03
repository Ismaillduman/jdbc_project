package com.cydeo.jdbctests.day2;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMaps {

    //Connection string

    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("SELECT FIRST_NAME,LAST_NAME,SALARY FROM Employees");

        ResultSetMetaData rsmd = rs.getMetaData();

        Map<String, Object> tableInfo1 = new HashMap<>();
        List<Map> allDataTableInfo = new ArrayList<>();

        tableInfo1.put("FIRST_NAME", "Steven");
        tableInfo1.put("LAST_NAME", "King");
        tableInfo1.put("Salary", 24000.00);
        Map<String, Object> tableInfo2 = new HashMap<>();
        tableInfo2.put("FIRST_NAME", "Neena");
        tableInfo2.put("LAST_NAME", "Kochhar");
        tableInfo2.put("Salary", 17000.00);


        allDataTableInfo.add(tableInfo1);
        allDataTableInfo.add(tableInfo2);
        System.out.println(allDataTableInfo);

        //close connection
        rs.close();
        statement.close();
        connection.close();

    }

    @Test
    public void task2() throws SQLException {

        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("SELECT FIRST_NAME,LAST_NAME,SALARY FROM Employees");

        ResultSetMetaData rsmd = rs.getMetaData();


        List<Map<String, Object>> allDataTableInfo = new ArrayList<>();

        while (rs.next()) {

            Map<String, Object> tableInfo = new HashMap<>();
            for (int j = 1; j <= rsmd.getColumnCount(); j++) {
                tableInfo.put(rsmd.getColumnName(j), rs.getString(j));
            }
            allDataTableInfo.add(tableInfo);
        }


        //each row info one by one
        for (Map<String, Object> eachRow : allDataTableInfo) {
            System.out.println(eachRow);
        }

        //close connection
        rs.close();
        statement.close();
        connection.close();
    }

    @Test
    public void task3() throws SQLException {
        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY from employees");
        ResultSetMetaData rsmd = rs.getMetaData();

        List<Map<String,Object>> allDataOfTable= new ArrayList<>();
        while (rs.next()) {
            Map<String,Object> rowDataOfTable= new HashMap<>();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                rowDataOfTable.put(rsmd.getColumnName(i),rs.getString(i));
            }
            allDataOfTable.add(rowDataOfTable);
        }
        System.out.println("-----------------task3--------");
        for (Map<String, Object> eachData : allDataOfTable) {
            System.out.println(eachData);
        }
    }

}
