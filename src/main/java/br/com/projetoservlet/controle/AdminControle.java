package br.com.projetoservlet.controle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import br.com.projetoservlet.dao.UsuarioDAO;
import br.com.projetoservlet.model.Usuario;

@WebServlet("/auth/admin")
public class AdminControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO usuarioDAO;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}

	public void init() {
		usuarioDAO = new UsuarioDAO();
	}
	
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String acao = request.getParameter("acao");
		try {
			switch(acao) {
				case "listar":
					listarUsuario(request, response);
					break;
			
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	private void listarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException{
		List<Usuario> listaUsuarios = usuarioDAO.listarTodosUsuarios();
		request.setAttribute("listaUsuarios", listaUsuarios);
		
		String path = request.getServletPath() + "/admin-listar-usuarios.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
