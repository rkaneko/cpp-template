#!/bin/bash

# see arg1
# arg0: some arg
existArg1()
{
    local EXIST_ARG1=false
    # See if $1's length greater than 0 .
    if [ $1 ]
    then
        local EXIST_ARG1=true
    fi
    echo ${EXIST_ARG1}
}

# delete file of path
# arg0: path to file
deleteFile()
{
    if [ `existArg1 $1` = false ]
    then
        cat <<_EOT_
deleteFile needs 1 argument.
Usage:
    deleteFile path2file
_EOT_
        exit 1
        return
    fi

    if [ -f $1 ]; then
        cat <<_EOT_
System is deleting
    '$1' .
Is it OK ?
Please Input y/n .
_EOT_

        read -p \>\  _FLAG_DELETE

        if [ ${_FLAG_DELETE} = "y" ]; then
            rm $1
            echo rm $1 .
        else
            echo "Stop script ."
            exit 1
        fi

    fi

    return
}
