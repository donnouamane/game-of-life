#!/bin/bash
mkdir patchTemplate/source
mkdir patchTemplate/backup
declare -A hashMap
for commit in $COMMITS
do
    key=$(git show -s --format=%ct $commit)
    hashMap["$key"]=$commit
    git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commit | xargs git checkout $commit
    git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commit | xargs tar cf patchTemplate/source/$key.tar --remove-files
done
cd  patchTemplate/source
echo      "FILES GROUPED BY COMMIT'S MESSAGE FOR PATCH $PATCH_VERSION" | tee ../release.txt
echo      ""  | tee -a ../release.txt
for file in `ls`; do echo $(basename "$file" .tar); done | sort -n |
while read f
do
    echo      ""
    echo      ""
    git show -s --format=%B ${hashMap["$f"]} 2>&1 | tee -a ../release.txt
    tar -tf "$f.tar" >> ../release.txt
    tar xvf "$f.tar" && rm "$f.tar"
done
cd ..
sed -e "s/\${patchVersion}/$PATCH_VERSION/" install.sh > install_patch_$PATCH_VERSION.sh
sed -e "s/\${patchVersion}/$PATCH_VERSION/" rollback.sh > rollback_patch_$PATCH_VERSION.sh
for variable in $COMMITS
do
echo "commit: $variable"
done
#set -x
rm -f generate_patch.sh install.sh rollback.sh
cd ..
PATCH_NAME=patch-$PATCH_VERSION
mv patchTemplate $PATCH_NAME
tar czvf $PATCH_NAME.tar.gz $PATCH_NAME
rm -rf $PATCH_NAME

