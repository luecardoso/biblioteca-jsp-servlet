package br.com.projetoservlet.controle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.jstl.core.Config;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Locale;
import java.util.ResourceBundle;

import br.com.projetoservlet.controle.i18n.I18nUtil;
import br.com.projetoservlet.dao.UsuarioDAO;
import br.com.projetoservlet.model.Usuario;
import br.com.projetoservlet.util.ManipulacaoData;

@WebServlet("/publica")
public class IndexControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO;

    public IndexControle() {
        super();
    }
    
	public void init(){
    	usuarioDAO = new UsuarioDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}
	
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		try {
			switch(acao) {
				case "novo":
					novoUsuario(request, response);
					break;
				case "salvar":
					salvarUsuario(request, response);
					break;
			
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	private void novoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("publica/publica-novo-usuario.jsp");
		dispatcher.forward(request, response);
	}
	
	private void salvarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String login = request.getParameter("login");
		String nascimento = request.getParameter("nascimento");
		
		ManipulacaoData manipulacaoData = new ManipulacaoData();
		Date dataNascimento = manipulacaoData.converterStringData(nascimento);
		
		Usuario usuario = new Usuario(nome, cpf, email, senha, login, dataNascimento, false);
		Usuario usuarioSalvo = usuarioDAO.salvarUsuario(usuario);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("publica/publica-novo-usuario.jsp");
		
//		HttpSession httpSession = request.getSession();
        Locale locale = request.getLocale();
        locale.setDefault(new Locale("ENLGISH"));  
        I18nUtil i18nUtil = new I18nUtil();
        String texto = i18nUtil.getMensagem(locale, "publica-novo-usuario.mensagem");
        
//        Config.set(httpSession, Config.FMT_LOCALE, locale);
//        Config.set(httpSession, Config.FMT_FALLBACK_LOCALE, locale);
//        
        
		request.setAttribute("mensagem", texto);

		dispatcher.forward(request, response);
	}
}
