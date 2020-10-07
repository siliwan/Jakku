#!/bin/sh
emacs -batch -l "${EMACS}" -eval $1 >> current.csv
