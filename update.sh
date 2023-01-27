#!/usr/bin/env bash
for dir in ./*
do
    if [ -d "$dir" ]
    then
        cd $dir
        bash ./update.sh
        cd ../
    fi
done
