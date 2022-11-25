#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
		sudo apt upgrade && sudo apt update -y
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá Aluno, serei seu assistente para instalação do Java!;"
sleep 2
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Verificando aqui se você possui o Java instalado...;"
sleep 2
java --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o java instalado!!"
		sleep 2
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (Y/n)?"		
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			sleep 2
			sudo apt install default-jre
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando Pacotes! Quase lá."
			sleep 2
fi
 		sudo apt install docker.io 
            sleep 2
            sudo systemctl start docker
            sleep 2
            sudo systemctl enable docker 
		sleep 2
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Instalando o container mysql 5.7!"
		sleep 2
			sudo docker build -t FastSystem .
			sudo dokcer run FastSystem
			
		