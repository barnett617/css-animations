# deploy.sh

#!/usr/bin/env sh

# abort on errors
set -e

# build
echo Linting..
npm run lint
echo Building. this may take a minute...
npm run build

datatime=$(date)

git add -A
message="deploy at ${datatime}"
echo message
git commit -m "${message}"

npm run publish