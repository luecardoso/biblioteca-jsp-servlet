package br.com.projetoservlet.controle.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

public class I18nUtil {

	public String getMensagem(Locale locale, String chave) {
		ResourceBundle bundle = ResourceBundle.getBundle("messages.messages", locale);
		
		String mensagem = bundle.getString(chave);
		return mensagem;
	}
}
