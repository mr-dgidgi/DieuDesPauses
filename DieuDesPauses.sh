#!/bin/bash


HeureMatin=37800 # 10h30

HeureAprem=57600 # 16h00
Absence=0
Temperature=0
MonologueResult=0

### Merci Chat GPT
# Obtenez la date actuelle au format de secondes depuis l'époque (1970-01-01 00:00:00 UTC)
current_time=$(date +%s)

# Obtenez la date actuelle au format de secondes depuis le début de la journée
seconds_since_midnight=$(date -d "$(date +%Y-%m-%d) 00:00:00" +%s)

# Calculez le nombre de secondes écoulées depuis le début de la journée
HeureActuelle=$((current_time - seconds_since_midnight))

test_integer () {
	if [ $1 -eq $1 ] 2>/dev/null; then
		return 1
	fi
}

yes_no_check () {
	if [ "$1" = "Y" ] || [ "$1" = "Yes" ] || [ "$1" = "yes" ] || [ "$1" = "Oui" ] || [ "$1" = "OUI" ] || [ "$1" = "oui" ] || [ "$1" = "O" ]; then
		echo 1

	elif [ "$1" = "N" ] || [ "$1" = "No" ] || [ "$1" = "no" ] || [ "$1" = "Non" ] || [ "$1" = "NON" ] || [ "$1" = "non" ] || [ "$1" = "N" ]; then
		echo 0

	elif [[ -z $1 ]]; then
		echo 99

	fi
}

Func_Absence () {

	echo -e "#########################################"
	echo -e "##########  Qui est Absent ?  ##########"
	echo -e "#########################################"
	echo -e "# 0. Personne"
	echo -e "# 1. Alexis"
	echo -e "# 2. Thomas"
	echo -e "# 3. Ghislain"
	echo -e "# 4. Alexis et Thomas"
	echo -e "# 5. Alexis et Ghislain"
	echo -e "# 6. Thomas et Ghislain"
	echo -e "#########################################"
	# Alexis	+ 445
	# Thomas	+ 157
	# Ghislain	-687
	# A+T		-79
	# G+T 		+125
	# A+G 		-248
	
	read -r
	
	if  ! test_integer $REPLY ; then
		case $REPLY in
			"0")
				Absence=67
				;;
			"1")
				Absence=445
				;;
			"2")
				Absence=157
				;;
			"3")
				Absence=-687
				;;
			"4")
				Absence=-79
				;;
			"5")
				Absence=125
				;;
			"6")
				Absence=-248
				;;
			"*")
				Func_Absence
				;;
		esac
	else
		Func_Absence
	fi
}

Func_Temperature () {

	echo -e "#########################################"
	echo -e "#####  Quelle température fait-il ?  ####"
	echo -e "#########################################"

	read -r

	if  ! test_integer $REPLY ; then
		if [ $REPLY -le 0 ]; then
			Temperature=-286
		elif [ $REPLY -le 5 ]; then
			Temperature=151
		elif [ $REPLY -le 10 ]; then
			Temperature=-242
		elif [ $REPLY -le 15 ]; then
			Temperature=-23
		elif [ $REPLY -le 20 ]; then
			Temperature=15
		elif [ $REPLY -le 30 ]; then
			Temperature=216
		else 
			Temperature=-231
		fi
	else
		Func_Temperature

	fi

}

Func_Pluie () {

	echo -e "#########################################"
	echo -e "##########  Est-ce qu'il pleut  #########"
	echo -e "#########################################"
	
	read -r

	PluieResult=$(yes_no_check $REPLY)
	if [ $PluieResult == 1 ]; then
		Pluie=159
	elif [ $PluieResult == 0 ]; then
		Pluie=-159
	else
		Func_Pluie
	fi

}

Func_Date () {


	JourValue=$(date +"%A")
	case $JourValue in
		"Monday")
			Jour=105
			;;
		"Tuesday")
			Jour=162
			;;
		"Wednesday")
			Jour=-20
			;;
		"Thursday")
			Jour=-48
			;;
		"Friday")
			if [ $Aprem == 1 ]; then
				Jour=-3744
			else
				Jour=144
			fi
			;;
		"*")
			Jour=-1000
			;;
	esac
	
	MoisValue=$(date +"%b")
	case $MoisValue in
		"Jan")
			Mois=-34
			;;
		"Feb")
			Mois=147
			;;
		"Mar")
			Mois=-48
			;;
		"Apr")
			Mois=-101
			;;
		"Mai")
			Mois=2
			;;
		"Jun")
			Mois=104
			;;
		"Jul")
			Mois=-64
			;;
		"Aug")
			Mois=-143
			;;
		"Sep")
			Mois=-149
			;;
		"Oct")
			Mois=-21
			;;
		"Nov")
			Mois=147
			;;
		"Dec")
			Mois=17
			;;
	esac

	JourNombre=$(date +"%d")
	if [ $(expr $JourNombre % 2) == 0 ];then
		Paire=254
	else
		Paire=-152
	fi


}

Func_Tata () {

	echo -e "#########################################"
	echo -e "#######  Est-ce que Tata est Là ?  ######"
	echo -e "#########################################"
	
	read -r

	TataResult=$(yes_no_check $REPLY)
	if [ $TataResult == 1 ]; then
		Tata=-179
	elif [ $TataResult == 0 ]; then
		Tata=179
	else
		Func_Tata
	fi

}

Func_Alexandre () {

	echo -e "#########################################"
	echo -e "####  Est-ce qu'Alexandre est Là ?  #####"
	echo -e "#########################################"
	
	read -r

	AlexandreResult=$(yes_no_check $REPLY)
	if [ $AlexandreResult == 1 ]; then
		Alexandre=-179
	elif [ $AlexandreResult == 0 ]; then
		Alexandre=179
	else
		Func_Alexandre
	fi

}

Func_Benjamin () {

	echo -e "#########################################"
	echo -e "####  Est-ce que Benjamin est Là ?  #####"
	echo -e "#########################################"
	
	read -r

	BenjaminResult=$(yes_no_check $REPLY)
	if [ $BenjaminResult == 1 ]; then
		Benjamin=265
	elif [ $BenjaminResult == 0 ]; then
		Benjamin=-265
	else
		Func_Benjamin
	fi

}

Func_Dimitri () {

	echo -e "#########################################"
	echo -e "####  Est-ce que Dimitri est Là ?  ######"
	echo -e "#########################################"
	
	read -r

	DimitriResult=$(yes_no_check $REPLY)
	if [ $DimitriResult == 1 ]; then
		Dimitri=-205
	elif [ $DimitriResult == 0 ]; then
		Dimitri=105
	else
		Func_Dimitri
	fi

}

Func_Monologue () {

	echo -e "#########################################"
	echo -e "# Est-il dans un monologue existenciel? #"
	echo -e "#########################################"
	
	read -r

	MonologueResult=$(yes_no_check $REPLY)
	if [ $MonologueResult == 1 ]; then
		Monologue=-205
	elif [ $MonologueResult == 0 ]; then
		Monologue=0
	else
		Func_Monologue
	fi

}

Func_Matin_Aprem () {

	echo -e "#########################################"
	echo -e "###  Pause du matin ou de l'aprem ?  ####"
	echo -e "#########################################"
	echo -e "# 0. Matin"
	echo -e "# 1. Aprem"
	
	read -r
	if  ! test_integer $REPLY ; then
		case $REPLY in
			"0")
				Aprem=0
				;;
			"1")
				Aprem=1
				;;
		esac
	fi
}

Func_FriteBelge () {
	
	echo -e "#########################################"
	echo -e "############  Frite Belge ?  ############"
	echo -e "#########################################"
	
	read -r

	FriteBelgeResult=$(yes_no_check $REPLY)
	if [ $FriteBelgeResult == 1 ]; then
		FriteBelge=-182
	elif [ $FriteBelgeResult == 0 ]; then
		FriteBelge=182
	else
		Func_FriteBelge
	fi


}

Func_Recup () {

	echo -e "#########################################"
	echo -e "###  Quelqu'un récupère des heures ?  ###"
	echo -e "#########################################"
	
	read -r

	RecupResult=$(yes_no_check $REPLY)
	if [ $RecupResult == 1 ]; then
		Recup=-1200

	elif [ $RecupResult == 0 ]; then
		Recup=0
	else
		Func_Recup
	fi

}

Func_Random () {

	echo -e "#########################################"
	echo -e "##############  Apagnan ? ###############"
	echo -e "#########################################"
	
	read -r
	
	RandomResult=$(echo -n $REPLY | od -td1  | awk '{$1=""}1' | awk -F " " '{print $NF}')
	RandomResult2=$(echo -n $REPLY | od -td1  | awk '{$1=""}1' | awk -F " " '{print $1}')
	
	Random=$(($RandomResult - $RandomResult2))

}

Func_Intro () {

echo -e "##################################################"
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣄⡀⢀⣀⣠⣤⣤⣶⣶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣿⠿⣩⣿⣿⣿⣿⣯⣛⣻⣯⣍⡛⣿⣿⣦⢰⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣽⣿⡟⢹⣫⡿⠛⣿⣿⣿⠿⣛⣿⣿⣿⣿⠙⣿⣿⣿⣯⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⡿⡟⣰⣶⠈⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢻⣿⣿⡿⣧⣈⠻⣿⣿⣷⡀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⢰⡇⢿⡟⢰⣿⣿⣿⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣿⣷⠈⢿⣧⡀⣿⣿⣿⡄⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⠘⣷⢨⣿⠀⠻⢿⣿⣯⣤⣾⢃⣤⣶⣿⣿⣿⣿⣿⣿⣿⡏⠙⣿⣷⣿⣿⣿⣃⣤⡶⠀'
echo -e '⠀⠀⠀⠀⣠⣴⣶⣶⣶⣿⡿⢹⣿⣿⠀⣿⣌⠛⠀⣠⣤⣌⡛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣠⡙⢿⣿⣿⣿⣿⠋⠀⠀'
echo -e '⠈⠓⠦⢾⠿⠛⠙⠛⠛⢉⣠⣾⣿⡟⠙⣦⡀⠀⡻⣿⣿⣿⣿⠒⠀⣿⠟⠁⣹⣉⠉⣿⣿⣿⣿⣿⣿⣷⠈⣿⣿⣿⡿⣾⠏⠀'
echo -e '⣀⡤⠤⠦⣴⣴⣶⣶⣶⣿⣿⣿⣿⡇⣰⣿⡟⠀⠳⣦⣄⣉⠛⠀⠀⢿⣿⣿⣿⡻⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⣤⡄'
echo -e '⠁⢀⣀⣠⣤⡽⠟⠿⣿⣿⣿⠿⢋⣴⣿⣿⣿⠀⠀⠻⣷⣉⠉⢛⢷⣦⣝⠿⠿⣯⣭⣸⣿⣿⣿⣇⠻⣿⣿⣿⡿⣋⠁⢸⡿⠁'
echo -e '⠀⠈⠙⣿⣥⣄⣀⣀⣀⣠⠤⠒⠋⢿⣿⠟⣩⠴⣶⠖⠈⠙⢷⣮⠳⣦⡍⢁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣾⠿⢿⣃⡿⠃⣭⣧⣄'
echo -e '⠀⠀⠒⠉⢿⣿⣿⣿⣿⣿⣶⣤⣄⣈⣉⣹⣵⡾⠋⠻⠿⢶⡆⠉⣡⣈⠁⠀⢮⣉⠙⠻⣅⢸⣿⠿⠋⣠⣴⡿⢋⣵⡖⣿⡉⠉'
echo -e '⠐⠒⠲⢦⣌⠛⠛⢋⣠⣾⣿⣿⣿⣿⣿⠿⠋⢀⠀⢀⠀⠸⠦⠔⠉⢻⣠⠤⢤⠉⠙⣛⡟⠉⠐⣶⠐⢿⡿⠃⠾⣁⡴⣿⣿⠀'
echo -e '⠀⠀⠀⠀⣿⣷⣶⣿⣿⠏⢀⣴⣶⠖⠀⠀⠀⠈⢩⠛⠻⢷⣦⡀⠀⠈⠁⠀⢠⡧⠴⠿⠿⡆⢀⣨⡤⣀⣠⣿⣶⣿⡷⢹⣧⠀'
echo -e '⠀⠀⠀⠀⠙⠻⠿⠟⠋⠀⣾⣿⣧⡀⠀⠀⠀⠀⠈⠳⣤⣀⠈⠛⢷⣤⣀⡀⠉⠀⠀⠀⠀⠸⠋⠀⠀⢸⣿⣿⣿⡏⠀⢸⣿⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠉⠀⠉⠀⠀⠀⢀⣠⣤⠤⠤⠴⢶⣾⣿⣿⣿⡇⠀⣼⠏⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⢿⣁⣀⣀⠀⣠⣿⣿⣿⣿⡟⠃⣰⡏⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠈⠉⢀⣴⣿⣿⣿⣿⣿⡇⢰⣿⡇⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⠀⢰⡇⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣀⣀⣤⣶⣿⣷⣶⣦⣌⣧⠀⠀⢠⣿⣀⣠⣾⣿⣿⣿⡿⢋⡩⠟⣿⣿⣇⡿⠋⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⠟⠁⠀⠈⠙⠻⣿⣿⣷⣤⣾⣿⣿⣿⠛⢉⣼⣟⣵⠏⣠⣾⢿⣿⡟⠁⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠀⠀⠈⣲⣶⣤⣤⡀⢀⡿⠉⢻⣿⡇⠀⣾⡿⢸⠏⣴⡿⠁⣼⣿⡇⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣦⠀⠀⢻⣿⡏⠀⣰⡿⠁⠀⣾⣿⣿⢰⣿⠇⢸⣾⡟⠁⣼⣿⣿⡇⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⣿⣦⣼⣿⣃⡴⠋⠀⠀⢰⡿⣿⣿⢸⡿⢀⣾⠟⢀⣾⣿⣿⣿⠇⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠋⠉⠀⠀⠀⢀⣞⡕⢻⣿⢸⣷⡞⠁⣤⡿⢿⣿⣿⡟⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠎⣠⣾⡿⢸⡟⢀⣾⠟⢀⣼⣿⠏⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠛⣼⣿⡟⢀⣼⠇⣼⡏⢠⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⢰⣿⡟⣰⣿⠏⣰⣿⢡⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⣾⡟⣸⣿⡟⢸⣿⣿⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣾⣿⠀⣿⣿⡇⢸⣿⡇⣼⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⠀⠘⠻⠧⠉⠉⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡀⠿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
echo -e "##################################################"

}


echo $HeureActuelle

Func_Intro
Func_Matin_Aprem
Func_Absence
Func_Temperature
Func_Pluie
Func_Date
Func_Tata
Func_Alexandre
Func_Benjamin


if [ $Aprem == 1 ];then
	Func_Recup
fi

if [ $Aprem == 0 ];then
	if [ $JourValue == "Tuesday" ] || [ $JourValue == "Friday" ]; then
		Func_FriteBelge
	else
		FriteBelge=0
	fi
fi
Func_Dimitri
if [ $DimitriResult == 1 ]; then
	Func_Monologue
fi

Func_Random

HeureMatin=$(($HeureMatin+$Absence+$Temperature+$Pluie+$Jour+$Mois+$Paire+$Tata+$Alexandre+$Benjamin+$FriteBelge+$Dimitri+$Random))
HeureAprem=$(($HeureAprem+$Absence+$Temperature+$Pluie+$Jour+$Mois+$Paire+$Tata+$Alexandre+$Benjamin+$Recup+$Dimitri+$Random))


echo -e "##################################################"
echo -e "################ Heure de Pause : ################"
echo -e "##################################################"
if [ $MonologueResult == 1 ]; then
	echo -e "Fuit pauvre fou !"
elif [ $Aprem == 0 ];then
	date -d@$HeureMatin -u +%H:%M
	if [ $HeureActuelle -gt $HeureMatin ]; then
		echo -e "T'es en retard couillon !!!"
	fi
else
	date -d@$HeureAprem -u +%H:%M
	if [ $HeureActuelle -gt $HeureAprem ]; then
		echo -e "T'es en retard couillon !!!"
	fi
fi
