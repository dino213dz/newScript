#!/bin/bash
######################################################################
# SCRIPT NAME : New Scripts Initiator
######################################################################
# CHORFA Alla-eddine a.k.a. Dino
# h4ckr213dz@gmail.com
# https://github.com/dino213dz
#
# Description: 
# Created: 04/08/2019
# Updated: 04/08/2019
# Version: 0.1 Beta
######################################################################


######################################################################
# VARIABLES: 
######################################################################

#SCRIPT VARS:
d213_author="CHORFA Alla-eddine a.k.a. Dino"
d213_email="h4ckr213dz@gmail.com"
d213_website="https://github.com/dino213dz"
d213_version="0.1 Beta"
d213_created="04/08/2019"
d213_updated="04/08/2019"

#STYLE VARS:
readonly -A d213_colors=( ['red']="\033[1;31m" ['yellow']="\033[1;33m" ['green']="\033[1;32m" ['cyan']="\033[1;36m" ['blue']="\033[1;34m" ['magenta']="\033[1;35m" ['white']="\033[1;37m" ['black']="\033[1;30m" )
readonly -A d213_styles=( ['reset']="\033[0m" ['italic']="\033[1;31m" ['bold']="\033[1;31m" ['underlined']="\033[1;31m" ['blink']="\033[1;31m" )
readonly -A d213_puces=( ['plus']="\n[+] " ['minus']=" |_[-] " )

#STEPS:
d213_steps=( "Chargement du fichier de configuration" "Args check" "Files creation" "Edit files" "End" )

style_title=${d213_colors["yellow"]}""${d213_puces["plus"]}
style_subtitle=${d213_colors["yellow"]}""${d213_puces["minus"]}
style_subsubtitle=${d213_colors["yellow"]}"  "${d213_puces["minus"]}
style_text=${d213_colors["cyan"]}""
style_text_okay=${d213_colors["green"]}""
style_text_error=${d213_colors["red"]}""
style_text_script=${d213_colors["magenta"]}""

#template default
newScript_config="./cfg/newScript.cfg"
newScript_template="./cfg/newScript.template"
newScript_dateCreated=$(date "+%D")
newScript_dateUpdated=$(date "+%D")

OLDIFS="$IFS"

######################################################################
# FUNCTIONS: 
######################################################################
function afficherAide {
	echo -e "$0 --name 'myNewScriptName.sh' --desc 'My script description here'"
	}
######################################################################
# ARGS: 
######################################################################
#recuperer les arguments passés au script
args=("$@")
nb_args=$#
for no_arg in $(seq 0 $nb_args); do
	valeur=${args[$no_arg]}
	if [ ${#valeur} -gt 0 ];then
		#parametres
		#helpe 
		if [ "$valeur" = "--help" ] || [ "$valeur" = "-h" ];then
			paramGetHelp='TRUE'
		fi

		#script name
		if [ "$valeur" = "--name" ] || [ "$valeur" = "-n" ];then
			newScript_name=${args[$(($no_arg+1))]}
		fi

		#script description
		if [ "$valeur" = "--description" ] || [ "$valeur" = "--desc" ] || [ "$valeur" = "-d" ];then
			newScript_description=${args[$(($no_arg+1))]}			
		fi
	fi
done
if [ "$paramGetHelp" = "TRUE" ];then
	echo -e "S.O.S!"
	afficherAide
	exit
else
	if [ ${#newScript_name} -gt 0 ];then
		if [ ${#newScript_description} -gt 0 ];then
			echo -e $style_title""${d213_steps[0]}": "
			echo -en $style_subtitle""$newScript_config
			source $newScript_config
			echo -e $style_text_okay"...Done!"
			echo -en $style_subtitle""$newScript_template
			echo -e $style_text_okay"...Done!"
			echo -e $style_title""${d213_steps[1]}": "
			echo -e $style_subtitle"New script filename:$style_text $newScript_name"
			echo -e $style_subtitle"New script description:$style_text $newScript_description"
		else
			echo -e "Il manque la description du script:"
			afficherAide
			exit 1
		fi
	else
		echo -e "Il manque le nom du script!"
		afficherAide
		exit 1
	fi
fi

# verifier les arguments
# ici #
echo -e $style_subtitle"Script variable's suffixe:$style_text $newScript_varSuffix"
echo -e $style_subtitle"Creation date:$style_text $newScript_dateCreated"
echo -e $style_subtitle"Update date:$style_text $newScript_dateUpdated"
echo -e $style_subtitle"Version:$style_text $newScript_version"
echo -e $style_subtitle"Author:$style_text $newScript_author"
echo -e $style_subtitle"email:$style_text $newScript_email"
echo -e $style_subtitle"Website:$style_text $newScript_website"
######################################################################
# MAIN PROGRAM: 
######################################################################
#creation du script
echo -e $style_title""${d213_steps[2]}": "
echo -en $style_subtitle"Filename:$style_text $newScript_name"
touch $newScript_name
chmod ugo+x $newScript_name
echo -e $style_text_okay"...Done!"
#edition du contenu du script
echo -e $style_title""${d213_steps[3]}": "
echo -en $style_subtitle"Filename:$style_text $newScript_name"
IFS=' '
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
while read -r template_line ; do
	template_line=${template_line//'__VARSFX__'/"$newScript_varSuffix"}
	template_line=${template_line//'__AUTHOR__'/"$newScript_author"}
	template_line=${template_line//'__EMAIL__'/"$newScript_email"}
	template_line=${template_line//'__WEBSITE__'/"$newScript_website"}
	template_line=${template_line//'__VERSION__'/"$newScript_version"}
	template_line=${template_line//'__DESCRIPTION__'/"$newScript_description"}
	template_line=${template_line//'__DATECREATED__'/"$newScript_dateCreated"}
	template_line=${template_line//'__DATEUPDATED__'/"$newScript_dateUpdated"}
	template_line=${template_line//'__SCRIPTNAME__'/"$newScript_name"}
	echo "$template_line" >> "$newScript_name"
	#echo "$template_line";sleep 0.1
done < "$newScript_template"
#echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
IFS=$OLDIFS
echo -e $style_text_okay"...Done!"
######################################################################
# END: 
######################################################################
echo -en $style_title""${d213_steps[4]}": "
echo -e $style_text"...Bye!"
echo -e ${d213_styles["reset"]}


