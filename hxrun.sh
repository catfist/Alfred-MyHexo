dir=`sed -n 2p Config | sed "s%~%$HOME%"`
editor=`sed -n 5p Config`
terminal=`sed -n 8p Config`
url=`sed -n 11p Config`
PATH=$PATH:/usr/local/bin
q="$1"
read cmd arg <<< "$q"

cd $dir

Create () {
file="${savedir}${today}${title}.md"
cat << EOB > "$file"
title: $arg
date: $date
pid: $key
status: $status
tags:
- 
---
EOB
open -a $editor "$file"
echo -n "Created: \"$title\""
}

case "$cmd" in
  "t" )
    open -a $terminal $dir
    echo "Openen: Project folder in terminal"
  ;;
  [nb] )
    title=`echo "$arg" | sed -e 's/ /-/g' -e 's/[\.\/]//g'`
    key=`md5 -qs "$title"`
    if [ $cmd = n ];then
      savedir=source/_posts/
      date="`date '+%Y-%m-%d %H:%M'`"
      today="`date '+%Y-%m-%d'`-"
      status=p
    else
      savedir=source/_drafts/
      date=""
      today=""
      status=d
    fi
    if [ -z $arg ];then
      echo -n "ERROR: Input title"
    else
      Create
    fi
  ;;
  "p" )
    cd source/_drafts
    num=`grep -l '^status: p$' *.md | wc -l`
    for file in `grep -l '^status: p$' *.md`
    do
    title=`grep -m1 'title:' $file | cut -c 8- | sed -e 's/ /-/g' -e 's/[\.\/]//g'`
    cat $file | (rm $file; sed -e "s/^date: .*$/date: `date '+%Y-%m-%d %H:%M'`/" > $file)
    mv $file ../_posts/`date '+%Y-%m-%d'`-$title.md
    done
    echo -n "Published: $num articles"
  ;;
  "u" )
    cd source/_posts
    num=`grep -l '^status: d$' *.md | wc -l`
    for file in `grep -l '^status: d$' *.md`
    do
    name=`echo $file | cut -c 12-`
    cat $file | (rm $file; sed 's/^\(date: \).*$/\1/' > $file)
    mv $file ../_drafts/$name
    done
    echo -n "Unpublished: $num articles"
  ;;
  "o" )
    open $url
    echo -n "Opened: Website"
  ;;
  "conf" )
    open _config.yml
    echo -n "Opened: '_config.yml'"
  ;;
  "h" )
    open https://github.com/catfist/Alfred-MyHexo
    echo -n "Opened: Github project page"
  ;;
  "g"|"generate"|"d"|"deploy"|"render"|"migrate"|"clean" )
    hexo $q >& /dev/null
    echo -n "Done: hexo ${q}"
  ;;
  "s"|"server" )
    tmp=/tmp/$$myhexoterm
    {
    echo "#!/bin/bash" > ${tmp}
    echo "cd $dir" >> ${tmp}
    echo "hexo $q" >> ${tmp}
    chmod +x ${tmp}
    } && {
    open -a $terminal ${tmp}
    } && {
    sleep 10
    open http://localhost:4000
    rm ${tmp}
    echo -n "Hexo server is running"
    }
  ;;
  "dg" )
    hexo d -g >& /dev/null
    open $url
    echo "Contents Deployed"
  ;;
  "tag" )
    echo "$arg" | pbcopy
    echo "Copied: $arg"
  ;;
esac
