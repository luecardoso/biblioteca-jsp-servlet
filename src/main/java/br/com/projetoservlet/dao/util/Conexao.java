package br.com.projetoservlet.dao.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Conexao {

	private static final String RESOURCE = "java:/comp/env/jdbc/postgresql";
	
	public static Connection getConexao() {
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup(RESOURCE);
			return dataSource.getConnection();
		}catch(SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
}
