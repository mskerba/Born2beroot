#!/bin/bash

va=free --mega | grep 'Mem' | awk '{print $3}'
vb=free --mega | grep 'Mem' | awk '{print $2}'
vs=free --mega | grep 'Mem' | awk '{print ($3/$2*100.0)}'
vl=top n1 | grep MiB | awk 'NR < 2{print ($8/$4 *100.0)}'

wall "
#Architecture: uname -a
#CPU physical : cat /proc/cpuinfo | grep processor | wc -l
#vCPU : cat /proc/cpuinfo | grep processor | wc -l
#Memory Usage: printf "%i/%iMB (%.2f%%)" "$va" "$vb" "$vs"
#Disk Usage: df --total -h | grep 'total' | tr -d 'G' |awk '{print $3"/"$4"Gb","("$5")"}'
#CPU load :printf "%.2f%%" "$vl"
#last boot :who -b | awk '{print $3,$4}'
#LVM use :lsblk | awk '{if($1){print "yes";exit;}else{print "no"}}'
#connexion TCP : netstat -an | grep ESTABLISHED| wc -l
#User log: who | wc -l
#Network : IP $(hostname -I | tr -d '\n' ; ip a | grep ether | awk {' print "("$2")"'})
#sudo: grep COMMAND= /var/log/sudo/journal.log | printf "$(wc -l) cmd"
"
