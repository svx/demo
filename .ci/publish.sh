#!/usr/bin/env bash

# die on error
set -e

# https://gist.github.com/cjus/1047794
echo 'Retrieving latest deploy...'
url=`curl -H "Authorization: Bearer $ENV_NAME_HERE" https://api.netlify.com/api/v1/sites/musing-raman-fd789e.netlify.com/deploys`
temp=`echo $url | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w -m 1 'id'`

# https://www.netlify.com/docs/api/#deploys
echo "Publishing build ${temp##*|}..."
curl -X POST -H "Authorization: Bearer $NETLIFY_PUBLISH_Key" -d "{}" "https://api.netlify.com/api/v1/sites/YOUR_SITE_HERE/deploys/${temp##*|}/restore"
