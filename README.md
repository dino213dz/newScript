# DESCRIPTION:
 - This Script will help you creating new scripts according to a template and a configuration file

#ABOUT
 - Author: CHORFA Alla-eddine a.k.a. Dino
 - Author: h4ckr213dz@gmail.com
 - Author: https://github.com/dino213dz
 - Author: Version: 0.1 Beta

# USAGE:
 - First, edit the configuration file : cfg/newScript.cfg
 - Run the commande ./newScript.sh --name 'myNewScriptFilename.sh' --desc 'My script description here'
 - This will create a script by coppyning the template and replacing theese variables:
   - __VARSFX__ : Configuration file
   - __AUTHOR__ : Configuration file
   - __EMAIL__ : Configuration file
   - __WEBSITE__ : Configuration file
   - __VERSION__ : Configuration file
   - __DESCRIPTION__ : Arguments value
   - __DATECREATED__ : Dynamicly replaced
   - __DATEUPDATED__ : Dynamicly replaced
   - __SCRIPTNAME__ : Arguments value
