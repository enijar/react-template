#!/usr/bin/env bash

LATEST_COMMIT=$(git rev-parse --short HEAD)
VERSIONS=$(ls -t releases)
KEEP_OLDER_VERSIONS=0 # Change this to keep 1 or more older versions

# To revert live to an older version run:
# ln -sf releases/short-commit-hash releases/latest

# Generate new version
npx react-scripts build
mkdir -p "releases/$LATEST_COMMIT"
rsync -r --delete build/* "releases/$LATEST_COMMIT"
ln -sf "releases/$LATEST_COMMIT" "releases/latest"
rm -rf build

# Remove old versions
VERSIONS_COUNT=0
for VERSION in $VERSIONS
do
  if [ "$VERSION" == "$LATEST_COMMIT" ]
  then
    continue
  fi

  if [ "$VERSION" == "latest" ]
  then
    continue
  fi

  if [ $VERSIONS_COUNT -eq $KEEP_OLDER_VERSIONS ]
  then
    rm -rf "releases/$VERSION"
    continue
  fi
  VERSIONS_COUNT=$((VERSIONS_COUNT + 1))
done
