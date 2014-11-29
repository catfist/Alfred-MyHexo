#!/bin/bash
# Change each variables to suit your '_config.yml'.

baseurl=`sed -n 11p Config`

file="$1"
date=`grep -m1 '^date' $file | sed 's/-/\//g' | cut -c 7-16`
pid=`grep -m1 '^pid' $file | sed 's/^pid: //'`
url="${baseurl}/${date}/${pid}"

open ${url}
