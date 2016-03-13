#!/bin/bash
clear
patchVersion=2016.2.1
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

cp -R --backup=existing --suffix=__$patchName custom/ ../../
find ../../custom/aushopping -name "*__$patchName" | xargs tar cvf - | (cd backup; tar xfp -)
find ../../custom/aushopping -name "*__$patchName" | xargs rm
find backup -name "*_$patchName" |
while read f
do
    mv $f  ${f%__*}
done

echo  Fin installation du patch $patchVersion.
echo     ""
echo     ""
echo     ""
