#!/bin/sh
cd infra/gcp
if [[ -f 'plan' ]]; then
 terraform apply plan
else
echo "plan doesn't exists"
exit 1
fi
