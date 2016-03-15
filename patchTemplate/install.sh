#!/bin/bash
clear
patchVersion=${patchVersion}
patchName=patch-$patchVersion

echo      "          |-----    |-------|    --------    --------  |       |"
echo	  "          |     |   |       |        |       |         |       |"
echo	  "          |-----    | ------|        |       |         |       |"
echo	  "          |         |       |        |       |         |-------|"
echo	  "          |         |       |        |       |         |       |"
echo	  "          |         |       |        |       |         |       |"
echo	  "          |         |       |        |       --------  |       |"
echo      ""
echo      ""
echo      "                        install    "$patchVersion
echo      ""
echo      ""


echo  [INFO] Debut d installation du patch $patchVersion 

cp -R --backup=existing --suffix=__$patchName source/. ../
find ../ -name "*__$patchName" | xargs tar cvf - | (cd backup; tar xfp -)
find ../ -name "*__$patchName" | xargs rm
find backup -name "*__$patchName" |
while read f
do
    mv $f  ${f%__*}
done

echo  Fin installation du patch $patchVersion.
echo     ""
echo     ""
echo     ""
