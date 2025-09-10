package rusioutlook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String db_URL = "jdbc:postgresql://ep-muddy-lake-adqrejdw-pooler.c-2.us-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require"; 
    private static final String USER = "neondb_owner";  
    private static final String PASSWORD = "npg_zelQ3Ucvx5Xs";  

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver"); // optional for JDBC 4+
        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL Driver not found", e);
        }
        return DriverManager.getConnection(db_URL, USER, PASSWORD);
    }
}
