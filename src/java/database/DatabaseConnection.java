package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String LOGIN_DB_URL = "jdbc:mysql://localhost:3306/db_login";
    private static final String CONTATOS_DB_URL = "jdbc:mysql://localhost:3306/db_rsm";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver MySQL não encontrado", e);
        }
    }
    
    public static Connection getLoginConnection() throws SQLException {
        return DriverManager.getConnection(LOGIN_DB_URL, USER, PASSWORD);
    }
    
    public static Connection getContatosConnection() throws SQLException {
        return DriverManager.getConnection(CONTATOS_DB_URL, USER, PASSWORD);
    }
}