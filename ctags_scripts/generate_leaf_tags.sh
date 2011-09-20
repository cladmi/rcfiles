#! /bin/sh

find * -type d -not \( -name .svn -prune \) -exec ./leaf_tags.sh {} \;

