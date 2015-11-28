#!/bin/bash

## Supported:
#   tar
#   tar.gz
#   tar.bz2
#   tar.xz
#   zip
#   7z

## Examples:
# ./extract -h # display this help
# ./extract <archive> # extract here
# ./extract <archive> <output direcory> # extract into output directory


function display_help {
    echo "
Examples:
    ./extract                               # display this help
    ./extract <archive>                     # extract here
    ./extract <archive> <output direcory>   # extract into output directory"
    exit -1
}

echo "**************************"
echo "* Simple extracting tool *"
echo "**************************"

## Check arguments
if [ ! -f $1 ]; then
    echo File $1 does not exists.
    exit -1
fi

if [ ! -z $2 ] && [ ! -f $2 ]; then
    OUTPUT="$2"
    mkdir -p $2
else
    OUTPUT="."
fi

## Exctract
case "$1" in
    *.tar )
        tar xvf $1 -C $2
        ;;
    *tar.gz )
        tar xvzf $1 -C $2
        ;;
    *tar.bz2 )
        tar xvjf $1 -C $2
        ;;
    *tar.xz )
        tar xJvf $1 -C $2
        ;;
    *zip )
        unzip $1 -d $2
        ;;
    *7z )
        7z x $1 -o$2
        ;;
    *)
    echo "Bad input file, or not yet implemented."
    display_help
        ;;
esac
