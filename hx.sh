read cmd arg <<< "$1"

case "$cmd" in
  "" )
    cmd=t
    t="Input command"
    st="If no commands, open Hexo project folder in Terminal"
  ;;
  "h"   )
    t="Reference to Help"
    st="or input some option"
  ;;
  "b" )
    t="Create draft"
    st="title: ${arg}"
  ;;
  "n" )
    t="Create new article"
    st="title: ${arg}"
  ;;
  "p" )
    t="Publish drafts"
    st="\"status: p\" in \"drafts\" folder"
  ;;
  "u" )
    t="Unpublish article"
    st="\"status: d\" in \"posts\" folder"
  ;;
  "o" )
    t="Open website"
    st="Open in brower"
  ;;
  "conf" )
    t="Open '_config,yml'"
    st="with default editor"
  ;;
  "dg"|"gd" )
    cmd="dg"
    t="Generate and Deploy contents"
    st="No options"
  ;;
  "g"|"generate" )
    t="Generate contents"
    st="Options: -d, --deploy, -w, --watch"
  ;;
  "s"|"server" )
    t="Run local server (at http://localhost:4000/)"
    st="Options: -p, --port, -s, --static, -l, --log, -d, --drafts"
  ;;
  "d"|"deploy" )
    t="Deploy contents"
    st="Options: --setup, -g, --generate, -m, --message"
  ;;
  "r"|"render" )
    cmd="render"
    t="Renders files"
    st="Options:  &lt;file1&gt; [file2] -o, --output"
  ;;
  "m"|"migrate" )
    cmd="migrate"
    t="Migrates content from other blog systems"
    st="Options: &lt;type&gt;"
  ;;
  "c"|"clean" )
    cmd="clean"
    t="Delete all generated files"
    st="No options"
  ;;
  # Replaced or unassumed commands
  # "l"|"list" )
  #   cmd="list"
  #   t="Lists all routes"
  #   st="Options: &lt;type&gt;"
  # ;;
  # "v"|"version" )
  #   cmd="version"
  #   t="Displays version information"
  #   st="No options"
  # ;;
  # "init" )
  #   t="Initializes a website"
  #   st="Options: [folder]"
  # ;;
  # "new" )
  #   t="Creates a new article"
  #   st="Options: [layout] &lt;title&gt;"
  # ;;
  # "p"|"publish" )
  #   t="Publishes a draft"
  #   st="Options: [layout] &lt;filename&gt;"
  # ;;
  "tag" )
    t="Search Hexo existing Tags or Categories"
    st="Input a Tags or Categories"
  ;;
  *   )
    t="Undefined command"
    st="Reference to Help: (hexo)h"
  ;;
esac

if [ "$cmd" = tag -a -n "$arg" ];then

# Path of your hexo project folder
dir=`sed -n 2p Config | sed "s%~%$HOME%"`

cd $dir/source/_posts
q=$arg
IFS=$'\n'

tags=()
while read tag
  do tags+=("$tag")
done < <(
  for file in `ls`
    do sed '/^---$/q' "$file" | grep '^- ' | sed 's/^- //'
  done | sort -u)

cat << EOB
<?xml version="1.0"?>
    <items>
EOB

for i in `echo "${tags[*]}" | grep -i "$q"`
do
  i=`echo "${i}" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e "s/'/\&apos;/g" -e 's/"/\&quot;/g'`
  cat << EOB
<item uid="${i}" arg="tag ${i}" valid="YES" >
    <title>(^) Copy: ${i}</title>
</item>
EOB
done

echo "</items>"

else

cat << EOB
<?xml version="1.0"?>
  <items>
    <item uid="hexo" arg="$cmd $arg" valid="YES" >
      <title>(^) Hexo: ${t}</title>
      <subtitle>${st}</subtitle>
      <subtitle mod="ctrl">Enter to act</subtitle>
    </item>
  </items>
EOB

fi
