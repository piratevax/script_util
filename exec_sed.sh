#!/bin/bash

clear

echo "********** EXECUTION SCRIPT SED **********"
read -p 'Option de sed à utiliser (laisser vide si aucune option a rajouter) : ' option

if [ $# -eq 1 ]
then
	if [[ (! -e $1) && (! -d $1) ]]
	then
		echo "Le fichier $PWD/$1 n'existe pas ou est invalide !!!"
		exit
	elif [[ (! -e sedsrc) && (! -d sedsrc) ]]
	then
		echo "Le fichier $PWD/sedsrc n'existe pas ou est invalide !!!"
		exit
	else
	sed $option -f sedsrc $1 > tmp.$1
	echo "Resulats dans tmp.$1"
	exit
	fi
elif [ $# -eq 2 ]
	then
	if [[ (! -e $1) && (! -d $1) ]]
	then
		echo "Le fichier $PWD/$1 n'existe pas ou est invalide !!!"
		exit
	elif [[ (! -e $2) && (! -d $2) ]]
	then
		echo "Le fichier $PWD/$2 n'existe pas ou est invalide !!!"
		exit
	else
		sed $option -f $1 $2 > tmp.$2
		echo "Resulats dans tmp.$2"
		exit
	fi
else
	echo ""
	echo "\"$0\" est un script exécutant un script SED."
	echo "Methode d'utilisation :"
	echo -e "\t $0 <sedsrc> file"
	echo "\"sedsrc\" est utilisé comme nom par défaut pour le fichier de script SED, il peut être omis lors de l'appel à ce script :"
	echo -e "\t $0 file"
fi
echo ""
echo "Fini !"
