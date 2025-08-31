package rusioutlook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String db_URL = "jdbc:postgresql://db.guaybzqyicwyhmzunxmt.supabase.co:5432/postgres"; 
    private static final String USER = "postgres";  
    private static final String PASSWORD = "Rusi@2025%%";  

    public static Connection getConnection() throws SQLException {
    	try {
    	    Class.forName("org.postgresql.Driver"); // Load PostgreSQL driver
    	} catch (ClassNotFoundException e) {
    	    throw new SQLException("PostgreSQL Driver not found", e);
    	}
        return DriverManager.getConnection(db_URL, USER, PASSWORD);
    }
}
