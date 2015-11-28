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

function mk_output_dir {
    if [ ! -z $1 ] && [ ! -f $1 ]; then
        mkdir -p $1
    fi
}

echo "**************************"
echo "* Simple extracting tool *"
echo "**************************"

## Check arguments
if [ ! -f $1 ]; then
    echo File $1 does not exists.
    exit -1
fi

if [ -f $1 ]; then
    OUTPUT_EXIST=true
else
    OUTPUT_EXIST=false
fi

## Exctract
OUTPUT=$2
case "$1" in
    *.tar )
        mk_output_dir $2
        tar xvf $1 -C $OUTPUT
    ;;
    *tar.gz )
        mk_output_dir $2
        tar xvzf $1 -C $OUTPUT
    ;;
    *tar.bz2 )
        mk_output_dir $2
        tar xvjf $1 -C $OUTPUT
    ;;
    *tar.xz )
        mk_output_dir $2
        tar xJvf $1 -C $OUTPUT
    ;;
    *zip )
        mk_output_dir $2
        unzip $1 -d $OUTPUT
    ;;
    *7z )
        mk_output_dir $2
        7z x $1 -o$OUTPUT
    ;;
    *)
        if  ! $OUTPUT_EXIST ; then
            rm -r
        fi
        if [ ! -z $1 ] ; then
            echo "Bad input file, or not yet implemented."
        fi
        display_help
    ;;
esac
