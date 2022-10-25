#!/bin/bash


function comando_segredo(){


	echo -e "Vim é melhor que nano\n"
	read

	clear

}

function abrir_github(){


	echo -e "Preparese para a melhor viagem de todos os tempos.... \n"

	STOP="\e[0m"

	printf "$STOP"

	sleep 2

	firefox https://github.com/Fabrizzio53

	clear

}

function numero_aleatorio(){


	


	echo -e "O meu número aleatório é....:\n "
	echo $[ $RANDOM % 9 + 1 ]

	read


}

function usar_nmap(){

	echo "Digite o ip: "
	read ip

	quem_sou_eu=$(id | cut -d "=" -f2 | cut -d "(" -f1)

	if [ "$quem_sou_eu" == 0 ];then

		echo    "*******************************************"
		echo    "*Iniciando o nmap, por favor aguarde......*"
		echo -e "*******************************************\n"

		nmap -vv -sC -sV -sS -D RND:20 -p- --open -oG scan-completo-tcp -Pn $ip

	else

		echo    "*******************************************"
		echo    "*Iniciando o nmap, por favor aguarde......*"
		echo -e "*******************************************\n"

		nmap -vv -sC -sV -p- --open -oG scan-completo-tcp -Pn $ip

	fi

	read



}

function meu_criador(){


	echo -e "Meu criado é o Fabrizzio Bridi de RM:93078 bip boop\n"
	read

}

function usar_ping(){


	echo -e "Digite um host a ser pingado: "
	read host

	echo -e "\n"

	valor=$(ping -c 1 $host | grep 64 | cut -d " " -f1)

	if [ "$valor" == 64 ];then

		echo -e "O host está vivo\n"

	else

		echo -e "Host não vivo ou bloqueando icmps :(\n"

	fi

	read

}


function comando_namoro(){


	echo -e "Eu não namoro, sou uma inteligência artificial, beep boop\n"
	read

}


function determinar_hora(){


	hora=$(date | cut -d " " -f4 | cut -d ":" -f1)


	if [[ "$hora" -gt 6 && "$hora" -lt 12 ]];then

		echo "Agora são: $hora horas, Bom dia"

	elif [[ "$hora" -gt 11 && "$hora" -lt 18 ]];then

		echo "Agora são: $hora horas, Boa tarde"

    elif [[ "$hora" -lt 6 || "$hora" -gt 17 ]];then

    	echo "Agora são: $hora horas, Boa noite"

    else

    	echo "Algum erro na function determinar_hora"

    	exit 1

	fi

	read


}

function comando_checar_servicos(){


	echo    "************************************"
	echo    "*Listando serviços na máquina......*"
	echo -e "************************************\n"

	sleep 2

	ss -atun

	read

}

function comando_checar_update(){

	echo    "**************************************"
	echo    "*Checando meus updates, aguarde......*"
	echo -e "**************************************\n"


	sleep 3

	quem_sou_eu=$(id | cut -d "=" -f2 | cut -d "(" -f1)

	if [ "$quem_sou_eu" == 0 ];then

		checar=$(apt update | grep "upgradable")

		if [ "$checar" == "" ];then

			echo "Estou na versão mais recente"

		else

			echo -e "Parece que temos atualização, você quer atualizar S ou N: "
			read decisao

			if [ "$decisao" == "S" ];then

				echo "Atualizando..."

				sleep 2

				apt upgrade

			else

				clear
				echo ":( Ok, caso queira atualizar basta rodar o comando de novo...."

			fi


		fi

	else

		echo "Essa opção precisa ser iniciada como root, por favor reinicie o programa..."

		exit 1

	fi

	read

}


terminal=$(whoami)

while true;do

	clear

	BLUE="\e[94m"
	RED="\e[31m"
	STOP="\e[0m"
	GREEN="\e[92m"

	printf "${GREEN}"

	figlet -w 200 -f standard MR_Robot

	

	echo -e "\n"

	printf "$RED"
	echo "Version 1.0"
	echo "https://github.com/Fabrizzio53"

	printf "$BLUE"

	echo -e "-----------------------------------------\n"

	printf "${GREEN}"

	echo -e "Digite um comando: \n"

	echo -e "1 - segredo\n"

	echo -e "2 - abrir github\n"

	echo -e "3 - numero_aleatorio\n"

	echo -e "4 - usar_nmap\n"

	echo -e "5 - meu_criador\n"

	echo -e "6 - usar_ping\n"

	echo -e "7 - namoro\n"

	echo -e "8 - determinar hora\n"

	echo -e "9 - checar servicos\n"

	echo -e "10 - checar update\n"

	echo -e "11 - Sair\n"

	if [ "$terminal" == root ];then
		printf "$RED"
		read -p "root# " escolha
		printf "${GREEN}"
		
	else
		printf "$BLUE"
		read -p "$terminal$ " escolha
		printf "${GREEN}"
		

	fi

	
	

	clear

	case $escolha in
		1|secret|secret|SECRET)
			comando_segredo
		;;

		2|github|abrirgithub|GITHUB)
			abrir_github
		;;

		3|random|aleatorio|ALEATORIO)
			numero_aleatorio
		;;

		4|nmap|scanner|scan)
			usar_nmap
		;;

		5|whoami|quemsoueu|criador)
			meu_criador
		;;


		6|ping|icmp|PING)
			usar_ping
		;;

		7|namoro|namorada|namorado)
			comando_namoro
		;;


		8|horas|quehorassao|horario)
			determinar_hora
		;;

		9|servicos|tcp|udp)
			comando_checar_servicos
		;;


		10|update|upgrade|atualizar)
			comando_checar_update
		;;



		11|sair|exit|bye)
			echo -e "Bye Bye :)\n"

			exit 0
		;;



		*)
			echo "Comando não reconhecido :("
			read
	esac



done