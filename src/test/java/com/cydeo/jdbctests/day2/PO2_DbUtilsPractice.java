package com.cydeo.jdbctests.day2;

import com.cydeo.jdbctests.utilities.DB_Utilities;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PO2_DbUtilsPractice {
    /* //create a connection
     *run query
     * get result
     * */

    @Test
    public void task() {
        DB_Utilities.createConnection();

        DB_Utilities.runQuery("select * from employees");

        System.out.println("====GET ME FIRST ROW FIRST COLUMN===");
        System.out.println(DB_Utilities.getFirstRowFirstColumn());

        System.out.println("====GET ME ALL COLUMN NAMES===");
        System.out.println(DB_Utilities.getAllColumnNamesAsList());

        System.out.println("====GET ME ALL FIRST NAMES===");
        System.out.println(DB_Utilities.getColumnDataAsList("First_NAME"));

        System.out.println("====GET ME HOW MANY ROWS WE HAVE===");
        System.out.println(DB_Utilities.getRowCount());

        System.out.println("====GET ME CERTAIN ROW INFO===");
        System.out.println("===GET ME AS MAP===");
        System.out.println(DB_Utilities.getRowMap(5));

        System.out.println("===GET ME AS LIST===");
        System.out.println(DB_Utilities.getRowDataAsList(5));

        System.out.println("===GET ME ALL DATA AS A LIST OF MAP ===");

      List<Map<String,String>> allDataListOfMap= DB_Utilities.getAllRowAsListOfMap();
        for (Map<String, String> eachMap : allDataListOfMap) {
            System.out.println(eachMap);
        }


        //close the connection
        DB_Utilities.destroy();

    }
}
