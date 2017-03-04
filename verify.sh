STAGING_REPO=${1%/}
WORKING_COPY_DIR=staging

wget -U "Any User Agent" --mirror --directory-prefix $WORKING_COPY_DIR --no-parent -e robots=off $STAGING_REPO/
find $WORKING_COPY_DIR -name "*.jar" -exec echo verifying {} \; -exec gpg --verify {}.asc {} \;
rm -rf $WORKING_COPY_DIR

