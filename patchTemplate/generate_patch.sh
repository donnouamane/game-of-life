#!/bin/bash
mkdir patchTemplate/source
mkdir patchTemplate/backup
for commit in $COMMITS
do
key=$(git show -s --format=%ct $commit)
git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commit | xargs git checkout $commit
git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commit | xargs tar cvf patchTemplate/source/$key.tar --remove-files
done
cd patchTemplate
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

