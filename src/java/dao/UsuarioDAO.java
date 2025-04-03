package dao;

import database.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    
    public boolean autenticar(String usuario, String senha) {
        String sql = "SELECT 1 FROM tb_login WHERE usuario = ? AND senha = ?";
        
        try (Connection conn = DatabaseConnection.getLoginConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, usuario);
            stmt.setString(2, senha);
            
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean usuarioExiste(String usuario) {
        String sql = "SELECT 1 FROM tb_login WHERE usuario = ?";
        
        try (Connection conn = DatabaseConnection.getLoginConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, usuario);
            
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}