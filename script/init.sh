#!/bin/bash

THIS_SCRIPT_NAME="init.sh"
WORKING_DIR=`pwd`
PARENT_DIR=`dirname $0`
REPOSITORY_NAME="cpp-template"

# include utility.sh
. ${PARENT_DIR}/utility.sh

if [ `existArg1 $1` = false ]
then
    cat <<_EOT_
error l14 at cpp-template/script/init.sh !
_EOT_
    exit 1
fi

SRC_DIR_NAME="src"

echo "Invoking "${PARENT_DIR}/${THIS_SCRIPT_NAME}

# create Makefile from script/template/Makefile
createMakefile()
{
    if [ `existArg1 $1` = false ]
    then
        cat <<_EOT_
error l29 at cpp-template/script/init.sh !
_EOT_
        exit 1
    fi
    local MAKEFILE="Makefile"

    local PATH_2_MAKEFILE=${WORKING_DIR}/${MAKEFILE}

    # invoke from utility.sh
    deleteFile ${PATH_2_MAKEFILE}


    echo "# Makefile for "$1 >${PATH_2_MAKEFILE}
    echo "" >>${PATH_2_MAKEFILE}
    echo "PROJECT_NAME = "$1 >>${PATH_2_MAKEFILE}

    while read LINE

    do
        echo -e ${LINE} >>${PATH_2_MAKEFILE}
    done < ${PARENT_DIR}/template/${MAKEFILE}

    echo "Created Makefile !"

    return
}

# delete .git directories and .gitkeep
deleteDotGit()
{
    DOT_GIT_DIRS=`find ${WORKING_DIR} -name .git`
    for DOT_GIT_DIR in ${DOT_GIT_DIRS[@]}
    do
        # echo ${DOT_GIT_DIR}
        rm -rf ${DOT_GIT_DIR}
    done

    DOT_GIT_KEEPS=`find ${WORKING_DIR} -name .gitkeep`
    for DOT_GIT_KEEP in ${DOT_GIT_KEEPS[@]}
    do
        # echo ${DOT_GIT_KEEP}
        rm -rf ${DOT_GIT_KEEP}
    done
    return
}

# delete script directory
deleteScriptDir()
{
    # echo rm -rf ${PARENT_DIR}
    rm -rf ${PARENT_DIR}
    return
}

# touch README.md
touchReadme()
{
    if [ -f ${WORKING_DIR}/README.md ]; then
        rm ${WORKING_DIR}/README.md
    fi

    touch ${WORKING_DIR}/README.md
    return
}

###############################################################################

echo "Your project name is: "$1

createMakefile $1

deleteDotGit

deleteScriptDir

touchReadme

exit 0
