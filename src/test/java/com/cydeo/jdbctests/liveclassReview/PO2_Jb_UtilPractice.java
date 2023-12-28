package com.cydeo.jdbctests.liveclassReview;

import com.cydeo.jdbctests.utilities.DB_Utilities;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class PO2_Jb_UtilPractice {
    @Test
    public void test1() {

        DB_Utilities.createConnection();

        DB_Utilities.runQuery("select COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES");

        System.out.println("GET ME ROW COUNT ");
        System.out.println(DB_Utilities.getRowCount());

        System.out.println("GET ME COLUMN COUNT ");
        System.out.println( DB_Utilities.getColumnCount());

        System.out.println("GET ALL COLUMN NAME AS LIST");
        System.out.println(DB_Utilities.getAllColumnNamesAsList());

        System.out.println("GET ROW DATA AS LIST--> FIRST ROW --> 1 ");
        System.out.println(DB_Utilities.getRowDataAsList(1));

        System.out.println("GET CELL VALUE --> int rowNum , int columnIndex");
        System.out.println(DB_Utilities.getCellValue(1, 2));

        System.out.println("GET CELL VALUE --> int rowNum ,String columnName");
        System.out.println(DB_Utilities.getCellValue(4, "COUNTRY_NAME"));

        System.out.println("GET FIRST ROW FIRST COLUMN VALUE");
        System.out.println(DB_Utilities.getFirstRowFirstColumn());

        System.out.println("GET COLUMN DATA AS LIST--> int columnNum");
        System.out.println(DB_Utilities.getColumnDataAsList(2));

        System.out.println("GET COLUMN DATA AS LIST--> String columnName");
        System.out.println(DB_Utilities.getColumnDataAsList("COUNTRY_NAME"));

        System.out.println("GET ROW MAP");
        System.out.println(DB_Utilities.getRowMap(2));

        System.out.println("GET ALL ROW AS LIST OF MAP");
        System.out.println(DB_Utilities.getAllRowAsListOfMap());

        List<Map<String,String>> allData= DB_Utilities.getAllRowAsListOfMap();

        for (Map<String, String> each : allData) {
            System.out.println(each);
        }

        DB_Utilities.destroy();
    }
}