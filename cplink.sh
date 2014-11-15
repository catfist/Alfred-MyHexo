# Change each variables to suit your '_config.yml'.

baseurl=`sed -n 11p Config`

file="$1"
title=`grep -m1 '^title' $file | cut -c 8-`
date=`grep -m1 '^date' $file | sed 's/-/\//g' | cut -c 7-16`
pid=`grep -m1 '^pid' $file | sed 's/^pid: //'`
link="[${title} | 豆腐メンタルは崩れない](${baseurl}${date}/${pid})"

echo -n "${link}"
