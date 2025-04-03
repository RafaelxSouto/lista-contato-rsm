package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import database.DatabaseConnection;

public class Contato {
    private int id;
    private String primeiroNome;
    private String ultimoNome;
    private String endereco;
    private String cidade;
    private String estado;
    private String ddd;
    private String celular;
    private String email;
    private int mesNascimento;
    private String cpf;

    public Contato() {}

    public Contato(String primeiroNome, String ultimoNome, String endereco, String cidade,
                  String estado, String ddd, String celular, String email, int mesNascimento, String cpf) {
        this.primeiroNome = primeiroNome;
        this.ultimoNome = ultimoNome;
        this.endereco = endereco;
        this.cidade = cidade;
        this.estado = estado;
        this.ddd = ddd;
        this.celular = celular;
        this.email = email;
        this.mesNascimento = mesNascimento;
        this.cpf = cpf;
    }

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getPrimeiroNome() { return primeiroNome; }
    public void setPrimeiroNome(String primeiroNome) { this.primeiroNome = primeiroNome; }
    public String getUltimoNome() { return ultimoNome; }
    public void setUltimoNome(String ultimoNome) { this.ultimoNome = ultimoNome; }
    public String getEndereco() { return endereco; }
    public void setEndereco(String endereco) { this.endereco = endereco; }
    public String getCidade() { return cidade; }
    public void setCidade(String cidade) { this.cidade = cidade; }
    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
    public String getDdd() { return ddd; }
    public void setDdd(String ddd) { this.ddd = ddd; }
    public String getCelular() { return celular; }
    public void setCelular(String celular) { this.celular = celular; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getMesNascimento() { return mesNascimento; }
    public void setMesNascimento(int mesNascimento) { this.mesNascimento = mesNascimento; }
    public String getCpf() { return cpf; }
    public void setCpf(String cpf) { this.cpf = cpf; }

    // Validações
    public boolean validarDados() {
        // Durante a atualização, apenas o endereço pode ser modificado
        // então não precisamos validar os outros campos
        return endereco != null && !endereco.trim().isEmpty();
    }

    private boolean validarNome() {
        return primeiroNome.matches("^[A-Za-z]+$") && ultimoNome.matches("^[A-Za-z]+$") &&
               cidade.matches("^[A-Za-z ]+$");
    }

    private boolean validarMesNascimento() {
        return mesNascimento >= 1 && mesNascimento <= 12;
    }

    private boolean validarCelular() {
        return celular.matches("^[0-9]{9}$");
    }

    private boolean validarCPF() {
        if (cpf == null || !cpf.matches("^[0-9]{11}$")) {
            return false;
        }
        
        // Validação dos dígitos verificadores do CPF
        int[] numeros = new int[11];
        for (int i = 0; i < 11; i++) {
            numeros[i] = Character.getNumericValue(cpf.charAt(i));
        }

        // Primeiro dígito verificador
        int soma = 0;
        for (int i = 0; i < 9; i++) {
            soma += numeros[i] * (10 - i);
        }
        int digito1 = 11 - (soma % 11);
        if (digito1 > 9) digito1 = 0;
        if (numeros[9] != digito1) return false;

        // Segundo dígito verificador
        soma = 0;
        for (int i = 0; i < 10; i++) {
            soma += numeros[i] * (11 - i);
        }
        int digito2 = 11 - (soma % 11);
        if (digito2 > 9) digito2 = 0;
        return numeros[10] == digito2;
    }

    private boolean validarDDD() {
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT 1 FROM tb_ddd_rsm WHERE ddd = ?")) {
            stmt.setString(1, ddd);
            return stmt.executeQuery().next();
        } catch (SQLException e) {
            return false;
        }
    }

    private boolean validarEstado() {
        try (Connection conn = DatabaseConnection.getContatosConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT 1 FROM tb_estado_rsm WHERE sigla = ?")) {
            stmt.setString(1, estado.toUpperCase());
            return stmt.executeQuery().next();
        } catch (SQLException e) {
            return false;
        }
    }
}