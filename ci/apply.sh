#!/bin/sh
cd infra/gcp
if [ -f 'plan' ]; then
 terraform apply plan
else
exit 1
fi
