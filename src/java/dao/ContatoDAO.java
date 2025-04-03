package dao;

import model.Contato;
import database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContatoDAO {
    
    public boolean cadastrar(Contato contato) {
        if (!contato.validarDados()) {
            return false;
        }
        
        String sql = "INSERT INTO tb_contato_rsm (primeiro_nome, ultimo_nome, endereco, cidade, estado, "
                + "ddd, celular, email, mes_nascimento, cpf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, contato.getPrimeiroNome());
            stmt.setString(2, contato.getUltimoNome());
            stmt.setString(3, contato.getEndereco());
            stmt.setString(4, contato.getCidade());
            stmt.setString(5, contato.getEstado().toUpperCase());
            stmt.setString(6, contato.getDdd());
            stmt.setString(7, contato.getCelular());
            stmt.setString(8, contato.getEmail());
            stmt.setInt(9, contato.getMesNascimento());
            stmt.setString(10, contato.getCpf());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Contato> listarTodos() {
        List<Contato> contatos = new ArrayList<>();
        String sql = "SELECT cpf, primeiro_nome, ddd, celular, email, mes_nascimento FROM tb_contato_rsm "
                + "ORDER BY primeiro_nome ASC";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Contato contato = new Contato();
                contato.setCpf(rs.getString("cpf"));
                contato.setPrimeiroNome(rs.getString("primeiro_nome"));
                contato.setDdd(rs.getString("ddd"));
                contato.setCelular(rs.getString("celular"));
                contato.setEmail(rs.getString("email"));
                contato.setMesNascimento(rs.getInt("mes_nascimento"));
                contatos.add(contato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contatos;
    }
    
    public List<Contato> listarPorEstado() {
        List<Contato> contatos = new ArrayList<>();
        String sql = "SELECT id, primeiro_nome, endereco, cidade, email, estado FROM tb_contato_rsm "
                + "ORDER BY estado ASC, primeiro_nome ASC";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setPrimeiroNome(rs.getString("primeiro_nome"));
                contato.setEndereco(rs.getString("endereco"));
                contato.setCidade(rs.getString("cidade"));
                contato.setEmail(rs.getString("email"));
                contato.setEstado(rs.getString("estado"));
                contatos.add(contato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contatos;
    }
    
    public Contato buscarPorPrimeiroNome(String primeiroNome) {
        String sql = "SELECT endereco, cidade, ddd, celular, email, cpf FROM tb_contato_rsm "
                + "WHERE primeiro_nome = ?";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, primeiroNome);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Contato contato = new Contato();
                contato.setEndereco(rs.getString("endereco"));
                contato.setCidade(rs.getString("cidade"));
                contato.setDdd(rs.getString("ddd"));
                contato.setCelular(rs.getString("celular"));
                contato.setEmail(rs.getString("email"));
                contato.setCpf(rs.getString("cpf"));
                return contato;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Contato> buscarPorMesAniversario(int mes) {
        List<Contato> contatos = new ArrayList<>();
        String sql = "SELECT * FROM tb_contato_rsm WHERE mes_nascimento = ? ORDER BY primeiro_nome ASC";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, mes);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setPrimeiroNome(rs.getString("primeiro_nome"));
                contato.setUltimoNome(rs.getString("ultimo_nome"));
                contato.setEndereco(rs.getString("endereco"));
                contato.setCidade(rs.getString("cidade"));
                contato.setEstado(rs.getString("estado"));
                contato.setDdd(rs.getString("ddd"));
                contato.setCelular(rs.getString("celular"));
                contato.setEmail(rs.getString("email"));
                contato.setMesNascimento(rs.getInt("mes_nascimento"));
                contato.setCpf(rs.getString("cpf"));
                contatos.add(contato);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contatos;
    }
    
    public boolean atualizar(Contato contato) {
        String sql = "UPDATE tb_contato_rsm SET endereco = ?, cidade = ?, estado = ?, "
                + "ddd = ?, celular = ?, email = ? WHERE cpf = ?";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, contato.getEndereco());
            stmt.setString(2, contato.getCidade());
            stmt.setString(3, contato.getEstado().toUpperCase());
            stmt.setString(4, contato.getDdd());
            stmt.setString(5, contato.getCelular());
            stmt.setString(6, contato.getEmail());
            stmt.setString(7, contato.getCpf());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean excluir(String cpf) {
        String sql = "DELETE FROM tb_contato_rsm WHERE cpf = ?";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, cpf);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Contato buscarPorCPF(String cpf) {
        String sql = "SELECT * FROM tb_contato_rsm WHERE cpf = ?";
        
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, cpf);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Contato contato = new Contato();
                contato.setId(rs.getInt("id"));
                contato.setPrimeiroNome(rs.getString("primeiro_nome"));
                contato.setUltimoNome(rs.getString("ultimo_nome"));
                contato.setEndereco(rs.getString("endereco"));
                contato.setCidade(rs.getString("cidade"));
                contato.setEstado(rs.getString("estado"));
                contato.setDdd(rs.getString("ddd"));
                contato.setCelular(rs.getString("celular"));
                contato.setEmail(rs.getString("email"));
                contato.setMesNascimento(rs.getInt("mes_nascimento"));
                contato.setCpf(rs.getString("cpf"));
                return contato;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}