#!/bin/sh
DIR_LIST=(Logger
    NMF_for_Julia
)


for DIR in ${DIR_LIST[@]}; do
    # create diff patch
    pushd $DIR
    git diff -u --no-prefix > ../$DIR.patch
    popd

    # diff patch 2 diff file list
    for FILE in `grep "diff --git" $DIR.patch | awk -F '{print $4}'`; do
        echo $FILE >> $DIR-list.txt
    done
done