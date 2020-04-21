#!/bin/sh

if [ `curl -s -o /dev/null -w "%{http_code}" "http://localhost:8080/login?from=$(date +%s)"` -eq 200 ]; then
    exit 0
fi

exit 1

