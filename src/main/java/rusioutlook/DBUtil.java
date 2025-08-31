package rusioutlook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String db_URL = "jdbc:postgresql://rusioutlookpostgre:UCOe1jN2ZNfqhsEG1ENoQBkiTLdNFlSV@dpg-d2q5q8je5dus73bml9vg-a.oregon-postgres.render.com/rusioutlook_database?sslmode=require"; 
    private static final String USER = "rusioutlookpostgre";  
    private static final String PASSWORD = "UCOe1jN2ZNfqhsEG1ENoQBkiTLdNFlSV";  

    public static Connection getConnection() throws SQLException {
    	try {
    	    Class.forName("org.postgresql.Driver"); // Load PostgreSQL driver
    	} catch (ClassNotFoundException e) {
    	    throw new SQLException("PostgreSQL Driver not found", e);
    	}
        return DriverManager.getConnection(db_URL, USER, PASSWORD);
    }
}
