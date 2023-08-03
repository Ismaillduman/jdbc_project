package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.*;

public class P03_Metadata {
    //Connection string

    String dbUrl = "jdbc:oracle:thin:@44.204.20.3:1521:XE";
    String dbUserName = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {
        Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select FIRST_NAME,LAST_NAME,SALARY,EMAIL  FROM EMPLOYEES WHERE ROWNUM<6");
        /*
        * ResultSet.TYPE_SCROLL_INSENSITIVE  to do flexible navigation between rows
        * ResultSet.CONCUR_READ_ONLY do not update anything from database only read
        * */
        //DatabaseMetadata give me data of data
        DatabaseMetaData dbMetaData = connection.getMetaData();

        System.out.println(dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverVersion());

        //resultsetmetadata give me about data of column what have (name count)

        ResultSetMetaData rsmd = rs.getMetaData();

        //how many columns we have
        System.out.println(rsmd.getColumnCount());

        //get me the columns name for index 2

        System.out.println(rsmd.getColumnName(1));

        //get all columns name dynamically
        System.out.println("----------columns name-------------");

        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.println(rsmd.getColumnName(i));
        }

        /*
         * resultSet --> it holds data table
         *
         * rs.next(); it iterates each row dynamically (with while loop)
         * rs.getString(columnIndex)---> to retrieve data itself
         *rs.getString(columnName)
         *resultSetMetaData --> It holds table info (columns name or count)
         *rsmd.getColumnCount()-->how many columns we have
         *  rsmd.getColumnName(index) --> it will give specific column name
         * */

        //write a code, that print whole table information for every query.
        //Column Name - Column value
        //EMPLOYEE_ID - 100
        //FIRST_NAME - Steven

        System.out.println("------all data dynamically-------");
        List<Map<String,Object>> allTableInfo= new ArrayList<>();
        Map<String, Object> tableInfo= new HashMap<>();
        while (rs.next()) {
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {

                tableInfo.put(rsmd.getColumnName(i), rs.getString(i));
                allTableInfo.add(tableInfo);

               // System.out.print(rsmd.getColumnName(i) + " - " + rs.getString(i) + " ");
            }

        }
        System.out.println(allTableInfo);
        System.out.println(allTableInfo.get(1).get("FIRST_NAME"));
    }
}
