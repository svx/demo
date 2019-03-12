#!/usr/bin/env bash
set -e # halt script on error

zip -r website.zip site


NETLIFY_SITE_NAME=sleepy-snyder-1f3b01.netlify.com

curl -H "Content-Type: application/zip" \
     -H "Authorization: Bearer $NETLIFY_PUBLISH_Key" \
     --data-binary "@website.zip" \
     https://api.netlify.com/api/v1/sites/$NETLIFY_SITE_NAME/deploys

