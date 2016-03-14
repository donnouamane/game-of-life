set +x
cd patchTemplate
mkdir source
mkdir backup
export PATCH_VERSION="2016.1"
sed -e "s/\${patchVersion}/$PATCH_VERSION/" install.sh > install_patch_$PATCH_VERSION.sh
sed -e "s/\${patchVersion}/$PATCH_VERSION/" rollback.sh > rollback_patch_$PATCH_VERSION.sh
rm -f generate_patch.sh install.sh rollback.sh
