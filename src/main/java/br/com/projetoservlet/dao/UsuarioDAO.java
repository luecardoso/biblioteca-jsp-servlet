package br.com.projetoservlet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import br.com.projetoservlet.dao.util.Conexao;
import br.com.projetoservlet.model.Usuario;

public class UsuarioDAO {

	private Connection connection;
	
	private void conectar() throws SQLException {
		if(connection == null || connection.isClosed()) {
			connection = Conexao.getConexao();
		}
	}
	
	private void desconectar() throws SQLException {
		if(connection != null && !connection.isClosed()) {
			connection.close();
		}
	}
	
	public Usuario salvarUsuario(Usuario usuario) throws SQLException {
		String sql = "insert into usuario (nome,cpf,data_nascimento,email,senha,login,ativo)"
				+ " values(?,?,?,?,?,?,?)";
		conectar();
		
		
		PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		statement.setString(1, usuario.getNome());
		statement.setString(2, usuario.getCpf());
		Date nascimento = new Date(usuario.getNascimento().getTime());
		statement.setDate(3, nascimento);
		statement.setString(4, usuario.getEmail());
		statement.setString(5, usuario.getSenha());
		statement.setString(6, usuario.getLogin());
		statement.setBoolean(7, usuario.isAtivo());

		statement.executeUpdate();
		
		ResultSet resultSet = statement.getGeneratedKeys();
		long id = 0;
		if(resultSet.next()) {
			id = resultSet.getLong("id");
		}
		statement.close();
		
		desconectar();
		
		usuario.setId(id);
		return usuario;
	}
}
