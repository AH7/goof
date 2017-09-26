#!/usr/bin/env bash
# check for snyk api token
mv cache/node_modules $PROJECT_PATH

if [ -z "$SNYK_TOKEN" ]; then
  echo 'Missing $SNYK_TOKEN, available at snyk.io/account'
  exit 1
fi

# cd to project path, bail out on failure
if [ ! -d "$PROJECT_PATH" ]; then
  echo 'Invalid project path' \""$PROJECT_PATH"\"
  exit 2
fi

# check for output redirect and exec snyk
# if [ -z "$OUTPUT_FILE" ]; then
cd $PROJECT_PATH
snyk test --json > ../build/results.json
ls -la
cat ../build/results.json
# else
#   exec snyk "$@" > "$PROJECT_PATH/$OUTPUT_FILE"
