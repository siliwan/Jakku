#!/bin/sh
> ~/todos.csv
emacs -batch -l ~/.emacs.d/init.el -eval '(org-batch-agenda-csv "t" org-agenda-span (quote month))' >> ~/todos.csv
