fix_false_group() {
    if [ -L "$1" ]; then
        rm "$1" # symlink, just get rid of it and have the script restore it properly
    elif [ -e "$1" ]; then
        # file exists and is a real file. remove all false symlinks to it
        for ALTERNATIVE in $2; do
            if [ -L "$ALTERNATIVE" ]; then
                TARGET="$(realpath $ALTERNATIVE)"
                if [ "$(basename $TARGET)" = "$1" ]; then
                    rm "$ALTERNATIVE"
                fi
            fi
        done
    fi
}

fix_cursors()  {
    # those two have been swapped in KDE and falsely linked by v0.1 of this script
    # ensure they do NOT point into the wrong group (2nd parameter)
    fix_false_group "fcf1c3c7cd4491d801f1e1c78f100000" "$SZ_FDG"
    fix_false_group "c7088f0f3e6c8088236ef8e1e3e70000" "$SZ_BDG"
    if [ "$1" = "override" ]; then
        for name in *; do
            if [ -L "$name" ]; then
                rm "$name"
            fi
        done
    fi
    for GROUP in $SHAPES; do
        eval SHAPE='$'$GROUP
        echo $SHAPE
        unset PRESENT
        for ALTERNATIVE in $SHAPE; do
            if [ -e $ALTERNATIVE ]; then
                PRESENT=$ALTERNATIVE
                break
            fi
        done
        if [ -z $PRESENT ]; then
            echo "*** WARNING *** No usable cursor for $GROUP"
            continue
        else
            echo $PRESENT
        fi
        for ALTERNATIVE in $SHAPE; do
            if [ ! -e $ALTERNATIVE ]; then
                ln -s $PRESENT $ALTERNATIVE
            fi
        done
    done
}

if [ "$(basename $PWD)" != "cursors" ]; then
    cd ~/.icons
    for name in *; do
        if [ -d "$name/cursors" ]; then
            echo "Fixing theme: $name"
            pushd "$name/cursors" > /dev/null
            fix_cursors $1
            popd > /dev/null
        fi
    done
else
    fix_cursors $1
fi
