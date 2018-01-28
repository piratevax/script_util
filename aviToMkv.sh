#!/bin/bash
### 2018-01-28 17:21
### Xavier Bussell


echo -e '\033[1;33m *** CONVERTISSEUR .avi TO .mkv h264 ***\033[0m'
echo ""

paq="libav-tools"
dpkg -l $paq &> /dev/null
options=("oui" "non")
if [[ $? -ne 0 ]]; then
	PS3="Le paquet : $paq, est necessaire. Voulez-vous l'installer ? "
	select opt in ${options[@]}
	do
		case $opt in
			"oui")
				sudo apt update && sudo apt upgrade
				sudo apt install $paq
				break
			;;
			"non")
				echo "Interruption de l'execution"
				exit 1
			;;
			* ) echo "Option invalide"
		esac
	done
fi

file=(*.avi)
if [[ ${#file[@]} -eq 0 || ${file[0]} =~ '*.avi' ]]; then
	echo -e '\033[1;31m Aucun fichier .avi detecte !\033[0m'
	echo "Interruption de l'execution"
	exit 1
fi

rep="aviToMkv/"
echo "Fichier a traiter : ${#file[@]}"

if [[ ! -d $rep ]]; then
	echo "Creation d'un dossier temporaire : aviToMkv/"
	mkdir $rep
fi

count=1
for (( i=0; i < ${#file[@]}; i++ ))
	do
		echo "> ${file[i]}"
		avconv -i ${file[i]} -c:v libx264 -c:a copy "${file[i]%.*}.mkv"
		mv ${file[i]} $rep
		count=$((count+1))
done

echo ""
echo "Conversion de $count/${#file[@]} fichiers !"

PS3="Supprimer les fichiers .avi ? "
select opt2 in ${options[@]}
do
	case $opt2 in
		"oui")
			echo "Suppression des fichiers dans $PWD/$rep"
			cd $rep
			rm *.avi
			echo "Suppression du repertoire temporaire $rep"
			rmdir $rep
			break
		;;
		"non")
			echo "Interruption de la suppression"
			break
		;;
		* ) echo "Option invalide"
	esac
done

echo "Fin de l'execution"
