#!/usr/bin/env bash
set -e # halt script on error

zip -r website.zip site

#curl -H "Content-Type: application/zip" \
#     -H "Authorization: Bearer $NETLIFYKEY" \
#     --data-binary "@website.zip" \
#     https://api.netlify.com/api/v1/sites/$API/deploys

NETLIFY_SITE_NAME=musing-raman-fd789e.netlify.com

curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer $NETLIFY_PUBLISH_Key" \
     --data-binary "@website.zip" \
     https://api.netlify.com/api/v1/sites/$NETLIFY_SITE_NAME/deploys

# https://www.netlify.com/docs/api/#deploys
#echo "Publishing Netlify build ${good_deploy}..."
#curl -X POST -H "Authorization: Bearer $NETLIFYKEY" -d "{}" "https://api.netlify.com/api/v1/sites/continuous-sphinx.netlify.com/deploys/${good_deploy}/restore"
