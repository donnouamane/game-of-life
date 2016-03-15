#!/bin/bash
clear
patchVersion=$PATCH_VERSION
patchName=patch-$patchVersion

echo      "reverting for "$patchVersion

cp -R --backup=none  backup/. ../

echo      "revert done for "$patchVersion
