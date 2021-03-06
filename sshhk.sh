#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m'
filename=~/bin/lista2
cpnnode=(`cat "$filename"`)
cale=~/ssh_health_check
opti=0
echo
echo
echo -ne "${GREEN} Health Check pentru Carduri${NC}"
echo
echo
for i in {0..13}
do
cat ~/comanda1 | ssh aaaa@${cpnnode[$i]} > $cale
cat $cale | egrep -a "Trap raised"\|Connected\|"card detail"\|Card\|Trap\|"XPL Errors"\|"chip Errors Detected" | egrep -va "Specific"\|logout\|"Press any key"
echo
echo
echo "Nodul $((i+1)) din 14"
echo
echo "pentru a trece la urmatorul nod apasa ENTER"
echo
echo
read opti
case $opti in
1);;
esac
done
echo
echo
echo -ne "${GREEN}Health Check pentru MDA-uri${NC}"
echo
echo
for i in {0..13}
do
cat ~/comanda2 | ssh aaaa@${cpnnode[$i]} > $cale
cat $cale | egrep -a "Trap raised"\|Connected\|"mda detail"\|MDA | egrep -av Specific\|logout\|"Press any key"
echo
echo
echo "Nodul $((i+1)) din 14"
echo
echo "pentru a trece la urmatorul nod apasa ENTER"
echo
echo
read opti
case $opti in
1);;
esac
done
