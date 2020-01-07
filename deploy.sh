# deploy.sh

#!/usr/bin/env sh

# abort on errors
set -e

# lint
echo Linting..
npm run lint

# build
echo Building. this may take a minute...
npm run build

# record public time
datatime=$(date "+%Y-%m-%d %H:%M:%S")

# commit change
git add -A
message="deploy at ${datatime}"
echo message
git commit -m "${message}"

# synchronize remote
git push

# publish (push dist directory to remote gh-pages branch)
npm run publish