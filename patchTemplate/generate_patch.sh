cd patchTemplate
mkdir source
mkdir backup
sed -e "s/\${patchVersion}/$PATCH_VERSION/" install.sh > install_patch_$PATCH_VERSION.sh
sed -e "s/\${patchVersion}/$PATCH_VERSION/" rollback.sh > rollback_patch_$PATCH_VERSION.sh
rm -f generate_patch.sh install.sh rollback.sh
cd ..
PATCH_NAME=patch-$PATCH_VERSION
mv patchTemplate $PATCH_NAME
tar czvf $PATCH_NAME.tar.gz $PATCH_NAME
rm -rf $PATCH_NAME
set +x
