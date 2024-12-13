package br.com.projetoservlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projetoservlet.dao.util.Conexao;
import br.com.projetoservlet.model.Papel;
import br.com.projetoservlet.model.Usuario;

public class PapelDAO {

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
	
	public Papel buscarPapelPorTipo(String tipo) throws SQLException {
		Papel papel = null;
		String sql = "select * from papel where tipo_papel like ?";
		
		conectar();
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, tipo);
		
		ResultSet resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			long id = resultSet.getLong("id");
			String tipoPapel = resultSet.getString("tipo_papel");
			
			papel = new Papel(id, tipoPapel);
			
		}
		resultSet.close();
		statement.close();
		desconectar();
		
		return papel;
	}
	
	public void atribuirPapelUsuario(Papel papel, Usuario usuario) throws SQLException {
		String sql = "insert into usuario_papel (usuario_id, papel_id)"
				+ " values (?,?)";
		conectar();
		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setLong(1, usuario.getId());
		statement.setLong(2, papel.getId());
		
		statement.executeUpdate();
		statement.close();

		desconectar();
	}
	
	public List<Papel> buscarPapelUsuario(Usuario usuario) throws SQLException{
		List<Papel> listaPapeis = new ArrayList<Papel>();
		String sql = "select papel.id, papel.tipo_papel"
				+ " from papel"
				+ " join usuario_papel"
				+ " on usuario_papel.papel_id = papel.id "
				+ " join usuario "
				+ " on usuario.id = usuario_papel.usuario_id "
				+ " where usuario.id = ?";
		
		conectar();
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, usuario.getId());
		
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next()) {
			long id = resultSet.getLong("id");
			String tipoPapel = resultSet.getString("tipo_papel");
			
			Papel papel = new Papel(id, tipoPapel);
			listaPapeis.add(papel);
		}
		resultSet.close();
		statement.close();
		
		desconectar();
		
		
		return listaPapeis;
	}
}
