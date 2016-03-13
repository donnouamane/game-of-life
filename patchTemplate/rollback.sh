#!/bin/bash
clear
patchVersion=2016.2.1
patchName=patch-$patchVersion

echo      "reverting for "$patchVersion

cp -R --backup=none  backup/custom/ ../../

echo      "revert done for "$patchVersion
