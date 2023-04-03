
drop table clientes.tb_empresa cascade; 
drop table clientes.tb_cargos cascade; 
drop table clientes.tb_salarios cascade;
drop table clientes.tb_funcionarios cascade;
drop table clientes.tb_dependente cascade; 
drop table clientes.tb_acoes cascade; 


create table clientes.tb_empresa(
	nome_empresa varchar(50) primary key,
	CNPJ varchar(14)
);

create table clientes.tb_cargos(
	nome varchar (50),
	CBO int8 primary key
);

create table clientes.tb_salarios(
	id_faixa_salario int8 primary key,
	codigo_cargo int8,
	id_cargo int8,
	constraint fk_id_faixa_salario
	foreign key (id_cargo)
	references clientes.tb_cargos(CBO)
	);

	create table clientes.tb_funcionarios(
	CPF varchar (50) primary key,
	titulo_eleitor varchar(50),
	endereço varchar (50),
	nome varchar (50),
	data_nascimento date,
	nome_empresa varchar(50),
	cargo varchar (50),
	constraint fk_CPF
	foreign key (CPF)
	references clientes.tb_funcionarios(CBO),
	constraint fk_CNPJ
	foreign key (nome_empresa)
	references clientes.tb_empresa(nome_empresa)
	);
	
	create table clientes.tb_dependente(
		CPF varchar(50) primary key,
		nome_da_mae varchar (50),
		data_nascimento date,
		codigo_funcionario int,
		constraint fk_funcionario
		foreign key (codigo_funcionario)
		references clientes.tb_funcionarios (CPF)
	);
	
	create table clientes.tb_acoes(
		codigo_operacoes int8 primary key,
		id_pagamento varchar (100)
	);
	
	insert into clientes.tb_empresa 
		(nome_empresa, CNPJ)
		values
		('restaurante','09876543212345'),
		('mercearia','23456543213467'),
		('sorveteria','89756042576324');
		
		insert into clientes.tb_cargos 
		(nome,CBO)
		values
		('garçom',123),
		('vendedor',456),
		('sorveteiro',789);
		
		insert into clientes.tb_acoes 
		(codigo_operacoes)
			values
			(1),
			(2),
			(3),
			(4);
		
		insert into clientes.tb_salarios 
		(id_faixa_salario)
		values
		(4367),
		(6567),
		(2234);
			
		insert into clientes.tb_funcionarios 
		(CPF,titulo_eleitor, endereço,nome, data_nascimento,nome_empresa,id_faixa_salario,cargo)
		values 
		('12345678911','346290','rua 1', 'marcelo silva', '21/02/1992','restaurante', 4367, 'garçom'),
		('23451769834','56780', 'rua 3', 'jorge rodrigo', '28/03/2004', 'mercearia',6567,'vendedor' ),
		('09346218593','98760', 'rua 2', 'jessica marcela' '30/05/2001','sorveteria',2234,'sorveteiro');
		
		insert into clientes.tb_dependente 
		(CPF,nome_da_mae,data_nascimento,codigo_funcionario)
		values
		('567.234.908.22','marlene silva', '23/04/1983',4367),
		('432.578.098.11', 'claudia rodrigo', '30/01/1983', 6567),
		('980.543.227.12','rosangela marcela','24/06/1983',2234);
	
	select * from clientes.tb_empresa;
	select * from clientes.tb_cargos;
	select * from clientes.tb_salarios;
	select * from clientes.tb_funcionarios;
	select * from clientes.tb_dependente;
	select * from clientes.tb_acoes;
	
	
	
		