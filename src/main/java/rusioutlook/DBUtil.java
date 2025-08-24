
package rusioutlook;   // 👈 use your package name

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String url = "jdbc:mysql://10.252.255.45:3306/rusioutlook"; // change DB name
    private static final String USER = "rusiuser";  // change if needed
    private static final String PASSWORD = "Steffin@2005"; // change if needed

    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
        System.out.println("✅ Database connected!");
        return DriverManager.getConnection(url, USER, PASSWORD);
    }
}
