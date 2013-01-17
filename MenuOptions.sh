#!/bin/bash

#This is a shell script for creating a menu and performing action according to the menu options.

#Here PS3 is a redefined with a custom menu Promt.If this line of code was omitted the default menu prompt (#?) would be displayed.

PS3='Select an Option and Press Enter:' 

# This code will create a menu options as per the requirement.

select i in  "Change Password" "See the disk space" "Login to other box using ssh" "Show all Service running" "Show all ports opened" "Show all java apps running" "Facility to kill a  app" "Exit"
    do
      case $i  in
      
              "Change Password") echo "Enter the username for which the password has to change:";
                                 read username;
                                 passwd $username;;

           "See the disk space") df -hk;;

 "Login to other box using ssh") echo "enter the server name for which the login required";
                                 read servername;
                                 ssh $servername;;
                                       
     "Show all Service running") service --status-all;;
        "Show all ports opened") netstat -a;;
   "Show all java apps running") ps -ef |grep -i java;;
      "Facility to kill an  app") echo "please enter the process ID";
                                 read PID;
                                 ID=`ps -ef|grep $PID|wc -l`;
                                 if [ $ID -ge 2 ];
                                    then
                                        kill $PID;
                                    else
                                        echo "The process is not running in the system"
                                 fi;;

                         "Exit") break;;
        esac
     done


