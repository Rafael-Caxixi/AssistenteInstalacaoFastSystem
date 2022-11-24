#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
		sleep 2
		sudo apt update && sudo apt upgrade -y

echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá Aluno, serei seu assistente para instalação do Java!;"
sleep 2
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Verificando aqui se você possui o Java instalado...;"
sleep 2

#----------------BAIXANDO O JAVA-----------------#



java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o java instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (Y/n)?"		
	read inst
	if [ \"$inst\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando Pacotes! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
					sleep 1
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					clear
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
					sleep 1
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
		sleep 1
	fi
fi

#----------------BAIXANDO O DOCKER -----------------#

docker --version
if [ $? -eq 0 ]
    then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o docker instalado!!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Instalando o container mysql 5.7!"
            sleep 2
            sudo docker pull mysql:5.7
			sleep 2
			sudo docker run -d -p 3306:3306 --name FastSystem -e "MYSQLDATABASE=FastSystem" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
            sleep 2
			docker exec -it FastSystem bash
			mysql -u root -p
			sleep 2
			urubu100
			sleep 2
			CREATE DATABASE FastSystem;
			USE FastSystem;

			CREATE TABLE Empresa(
			id_empresa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_empresa VARCHAR(100),
			cnpj_empresa VARCHAR (14),
			cep_empresa VARCHAR(11),
			numero_empresa INT,
			telefone_empresa VARCHAR(13),
			representante VARCHAR(100),
			email_empresa VARCHAR(50)
			)AUTO_INCREMENT = 0;

			CREATE TABLE Funcionario(
			id_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			fk_empresa INT,
			nome_funcionario VARCHAR(100),
			is_admin BINARY(1),
			cpf_funcionario VARCHAR(11),
			email_funcionario VARCHAR(50),
			senha_funcionario VARCHAR(25),
			telefone_funcionario VARCHAR(13),
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
			)AUTO_INCREMENT = 100;

			CREATE TABLE Maquina(
			id_maquina INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			fk_empresa INT,
			tipo_maquina VARCHAR(7),
			CHECK (tipo_maquina = 'DESKTOP' or tipo_maquina = 'TOTEM'),
			nome_maquina VARCHAR(15),
			sistema_operacional_maquina varchar(45),
			tempo_atividade_maquina LONG,
			email_maquina VARCHAR(45),
			senha_maquina VARCHAR(45),
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
			)AUTO_INCREMENT = 0;

			CREATE TABLE App(
			id_app INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_app VARCHAR(60)
			)AUTO_INCREMENT = 1000;

			CREATE TABLE App_Empresa(
			fk_empresa INT,
			fk_app INT,
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa),
			FOREIGN KEY(fk_app) REFERENCES App(id_app),
			PRIMARY KEY (fk_empresa, fk_app)
			);

			CREATE TABLE Registro_Processo(
			id_registro_processo INT PRIMARY KEY AUTO_INCREMENT,
			nome_processo VARCHAR(45),
			data_hora DATETIME,
			is_autorizado BINARY(1),
			fk_maquina INT,
			FOREIGN KEY (fk_maquina) references Maquina(id_maquina)
			);

			CREATE TABLE Componente(
			id_componente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_componente VARCHAR(45),
			is_ativo BINARY(1),
			fabricante_componente VARCHAR(45),
			modelo_componente VARCHAR(100),
			capacidade_componente FLOAT,
			fk_maquina INT,
			FOREIGN KEY (fk_maquina) REFERENCES Maquina(id_maquina)
			);
				
			CREATE TABLE Tipo_Registro(
			id_tipo_registro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			descricao_tipo VARCHAR(20)
			);

			CREATE TABLE Registro(
			data_hora DATETIME,
			medida FLOAT,
			fk_tipo_registro INT,
			fk_componente INT,
			FOREIGN KEY(fk_componente) REFERENCES Componente(id_componente),
			FOREIGN KEY(fk_tipo_registro) REFERENCES Tipo_Registro(id_tipo_registro)
			);

			INSERT INTO Empresa VALUES 
			(null, 'FastSystem', 123456789, 02535412, 1522, 11942563656, 'Endryl', "endryl@gmail.com"),
			(null, 'McDonalds', 987654321, 32654845, 365, 11953145796, 'Donald McDonalds', 'dodo@gmail.com');

			INSERT INTO Maquina VALUES 
			( null, 1, "DESKTOP", "Desktop 1", '', 0, 'felipe.fastsystem@gmail.com', '1234' ),  
			( null, 2, "TOTEM", "Totem 1", '', 0, 'endryl.mcdonalds@gmail.com', '12345'),
			( null, 2, "DESKTOP", "Desktop 1", '', 0, 'vitoria.mcdonalds@gmail.com', '12346');

			INSERT INTO Tipo_Registro VALUES
			( null, 'GB' ),
			( null, '%' );

			INSERT INTO Funcionario VALUES 
			(null, 1, 'Endryl', 1, 12345678912, 'endryl@gmail.com', 12345678, '942518747'),
			(null, 2, 'Felipe', 1, 98765432112, 'felipe@gmail.com', 12345678, '965321547');

			INSERT INTO App VALUES
			( null, 'chrome' ),
			( null, 'WhatsApp' ),
			( null, 'AnyDesk' );


					
			UPDATE Componente SET 
				nome_componente = 'Processadorrrrr', 
				is_ativo = true, 
				fabricante_componente = 'GenuineIntel', 
				modelo_componente = 'Intel(R) Core(TM) i7-10610U CPU @ 1.80GHz', 
				capacidade_componente = 10,
				fk_maquina = 1
					WHERE id_componente = 1 AND nome_componente LIKE 'Processador%';
					
			UPDATE Componente SET 
				nome_componente = 'Memóriaaaa', 
				is_ativo = true,
				capacidade_componente = 10,
				fk_maquina = 1
					WHERE id_componente = 2 AND nome_componente LIKE 'Memória%';
					
			UPDATE Componente SET 
	nome_componente = 'Disco 1 BEBE', is_ativo = true, modelo_componente = 'SSSTC CA5-8D256-Q79 (Standard disk drives)', capacidade_componente = 256
    WHERE id_componente = 3 AND nome_componente LIKE 'Disco 1%';

		sudo git clone https://github.com/FastSystem-G1/BackEnd.git

		cd login-fastsystem
		cd target
		sudo su chmod 777 login-fastsystem-1.0-SNAPSHOT-jar-with-dependencies.jar
		java -jar login-fastsystem-1.0-SNAPSHOT-jar-with-dependencies.jar

    else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do docker instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Docker (Y/n)?"		
	read inste
    if [ \"$inste\" == \"Y\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o docker ;D"
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Instalando o docker!"
            sleep 2
            sudo apt install docker.io
            sleep 2
            sudo systemctl start docker
            sleep 2
            sudo systemctl enable docker
            sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Instalando o container mysql 5.7!"
            sleep 2
            sudo docker pull mysql:5.7
			sleep 2
			sudo docker run -d -p 3306:3306 --name FastSystem -e "MYSQLDATABASE=FastSystem" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
            sleep 2
			docker exec -it FastSystem bash
			mysql -u root -p
			urubu100
			sleep 2
			CREATE DATABASE FastSystem;
			USE FastSystem;


			CREATE TABLE Empresa(
			id_empresa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_empresa VARCHAR(100),
			cnpj_empresa VARCHAR (14),
			cep_empresa VARCHAR(11),
			numero_empresa INT,
			telefone_empresa VARCHAR(13),
			representante VARCHAR(100),
			email_empresa VARCHAR(50)
			)AUTO_INCREMENT = 0;

			CREATE TABLE Funcionario(
			id_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			fk_empresa INT,
			nome_funcionario VARCHAR(100),
			is_admin BINARY(1),
			cpf_funcionario VARCHAR(11),
			email_funcionario VARCHAR(50),
			senha_funcionario VARCHAR(25),
			telefone_funcionario VARCHAR(13),
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
			)AUTO_INCREMENT = 100;

			CREATE TABLE Maquina(
			id_maquina INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			fk_empresa INT,
			tipo_maquina VARCHAR(7),
			CHECK (tipo_maquina = 'DESKTOP' or tipo_maquina = 'TOTEM'),
			nome_maquina VARCHAR(15),
			sistema_operacional_maquina varchar(45),
			tempo_atividade_maquina LONG,
			email_maquina VARCHAR(45),
			senha_maquina VARCHAR(45),
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
			)AUTO_INCREMENT = 0;

			CREATE TABLE App(
			id_app INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_app VARCHAR(60)
			)AUTO_INCREMENT = 1000;

			CREATE TABLE App_Empresa(
			fk_empresa INT,
			fk_app INT,
			FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa),
			FOREIGN KEY(fk_app) REFERENCES App(id_app),
			PRIMARY KEY (fk_empresa, fk_app)
			);

			CREATE TABLE Registro_Processo(
			id_registro_processo INT PRIMARY KEY AUTO_INCREMENT,
			nome_processo VARCHAR(45),
			data_hora DATETIME,
			is_autorizado BINARY(1),
			fk_maquina INT,
			FOREIGN KEY (fk_maquina) references Maquina(id_maquina)
			);

			CREATE TABLE Componente(
			id_componente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			nome_componente VARCHAR(45),
			is_ativo BINARY(1),
			fabricante_componente VARCHAR(45),
			modelo_componente VARCHAR(100),
			capacidade_componente FLOAT,
			fk_maquina INT,
			FOREIGN KEY (fk_maquina) REFERENCES Maquina(id_maquina)
			);
				
			CREATE TABLE Tipo_Registro(
			id_tipo_registro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
			descricao_tipo VARCHAR(20)
			);

			CREATE TABLE Registro(
			data_hora DATETIME,
			medida FLOAT,
			fk_tipo_registro INT,
			fk_componente INT,
			FOREIGN KEY(fk_componente) REFERENCES Componente(id_componente),
			FOREIGN KEY(fk_tipo_registro) REFERENCES Tipo_Registro(id_tipo_registro)
			);

			INSERT INTO Empresa VALUES 
			(null, 'FastSystem', 123456789, 02535412, 1522, 11942563656, 'Endryl', "endryl@gmail.com"),
			(null, 'McDonalds', 987654321, 32654845, 365, 11953145796, 'Donald McDonalds', 'dodo@gmail.com');

			INSERT INTO Maquina VALUES 
			( null, 1, "DESKTOP", "Desktop 1", '', 0, 'felipe.fastsystem@gmail.com', '1234' ),  
			( null, 2, "TOTEM", "Totem 1", '', 0, 'endryl.mcdonalds@gmail.com', '12345'),
			( null, 2, "DESKTOP", "Desktop 1", '', 0, 'vitoria.mcdonalds@gmail.com', '12346');

			INSERT INTO Tipo_Registro VALUES
			( null, 'GB' ),
			( null, '%' );

			INSERT INTO Funcionario VALUES 
			(null, 1, 'Endryl', 1, 12345678912, 'endryl@gmail.com', 12345678, '942518747'),
			(null, 2, 'Felipe', 1, 98765432112, 'felipe@gmail.com', 12345678, '965321547');

			INSERT INTO App VALUES
			( null, 'chrome' ),
			( null, 'WhatsApp' ),
			( null, 'AnyDesk' );


					
			UPDATE Componente SET 
				nome_componente = 'Processadorrrrr', 
				is_ativo = true, 
				fabricante_componente = 'GenuineIntel', 
				modelo_componente = 'Intel(R) Core(TM) i7-10610U CPU @ 1.80GHz', 
				capacidade_componente = 10,
				fk_maquina = 1
					WHERE id_componente = 1 AND nome_componente LIKE 'Processador%';
					
			UPDATE Componente SET 
				nome_componente = 'Memóriaaaa', 
				is_ativo = true,
				capacidade_componente = 10,
				fk_maquina = 1
					WHERE id_componente = 2 AND nome_componente LIKE 'Memória%';
					
			UPDATE Componente SET 
			nome_componente = 'Disco 1 BEBE', is_ativo = true, modelo_componente = 'SSSTC CA5-8D256-Q79 (Standard disk drives)', capacidade_componente = 256
    		WHERE id_componente = 3 AND nome_componente LIKE 'Disco 1%';

			sleep 2
			clear

		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o docker por enquanto, até a próxima então!"
		sleep 2
	fi
fi

		sudo git clone https://github.com/FastSystem-G1/BackEnd.git

		cd login-fastsystem
		cd target
		sudo su chmod 777 login-fastsystem-1.0-SNAPSHOT-jar-with-dependencies.jar
		java -jar login-fastsystem-1.0-SNAPSHOT-jar-with-dependencies.jar


