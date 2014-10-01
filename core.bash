#!/bin/bash
for i in $(ls distros/); do echo -n $(echo $i |sed -e 's/.sh//g') |sed -e 's|\(.*\)|"\1"|' && echo -n " " $(awk 'NR==2' distros/$i |cut -d ":" -f 2 | sed -e 's/^[ \t]*//' |sed -e 's|\(.*\)|"\1"|') && echo " off" ; done | sed -e ':a;N;$!ba;s/\n/ /g' > distros.txt
cat selection.txt
dialog --checklist "TODO: choose something:" 10 40 3 --file distros.txt 2> selection.txt

readarray -t selection < selection.txt

for i in $(echo ${selection[@]} | tr "," " ")
do
    ./distros/"$i".sh
done



