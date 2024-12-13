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

create table papel
(
	id bigserial not null,
	tipo_papel character varying(50),
	constraint papel_pkey primary key (id)
);

create table usuario_papel
(
	usuario_id bigint not null,
	papel_id bigint not null,
	constraint fk_usuario_papel_papel_id foreign key (papel_id)
		references papel (id) on delete cascade,
	constraint fk_usuario_papel_usuario_id foreign key (usuario_id)
		references usuario (id) on delete cascade
);

insert into papel (tipo_papel) values ('ADMIN');
insert into papel (tipo_papel) values ('USER');
insert into papel (tipo_papel) values ('BIBLIO');