create table usuario
(
	id bigserial not null,
	ativo boolean,
	cpf character varying(30),
	data_nascimento date,
	email character varying(50),
	login character varying(50),
	nome character varying(255),
	senha character varying(50),
	constraint usuario_pkey primary key(id)
);