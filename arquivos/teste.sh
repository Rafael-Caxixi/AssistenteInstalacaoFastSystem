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
		
fi

#----------------BAIXANDO O DOCKER -----------------#  
 sudo apt install docker.io -y
            sleep 2
            sudo systemctl start docker
            sleep 2
            sudo systemctl enable docker 
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Instalando o container mysql 5.7!"
			sudo docker build -t FastSystem
			sudo dokcer run FastSystem
			
		