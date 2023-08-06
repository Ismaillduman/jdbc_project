package com.cydeo.jdbctests.day2;

import com.cydeo.jdbctests.utilities.DB_Utilities;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class Library_Test {
    // Create connection to MySQL Database
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username = "library2_client";
    String password = "6s2LQQTjBcGFfDhY";

    @Test
    public void task() {

        DB_Utilities.createConnection(url, username, password);

        DB_Utilities.runQuery("select count(*) from books");
        String booksCount = DB_Utilities.getFirstRowFirstColumn();
        System.out.println(booksCount);


        String actualBooksCount = "11622";
        Assertions.assertEquals(booksCount, actualBooksCount);


        DB_Utilities.destroy();

    }
}
