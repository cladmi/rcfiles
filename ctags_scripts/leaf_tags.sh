#! /bin/sh

cd "$1"

# only create tags file when there are files
ls *.[ch] > /dev/null 2>&1
test $? -eq 0 && \
	ctags --sort=yes --language-force=C --c-kinds=+p --fields=+iaS --extra=+q *.[ch]
