#!/bin/sh

TITLE=manual
AUTHOR=author
VERSION=1.0

usage() {
    echo "$0 -t title -a author -v version"
}

OPT=`getopt -q -o t:a:v: -- "$@"`
if [ $? != 0 ]; then
    usage
fi

eval set -- "$OPT"
while true
do
  case $1 in
    -t ) TITLE=$2 ; shift 2 ;;
    -a ) AUTHOR=$2 ; shift 2 ;;
    -v ) VERSION=$2 ; shift 2 ;;
    -- ) shift; break ;;
  esac
done


sphinx-quickstart <<EOF

y

$TITLE
$AUTHOR
$VERSION









y






EOF

cat >> source/conf.py <<EOF

# These lines are automatically inserted for Japanese document
language = 'ja'
latex_docclass = {'manual': 'jsbook'}

EOF