#!/bin/bash

THIS_SCRIPT_NAME="init.sh"
WORKING_DIR=`pwd`
PARENT_DIR=`dirname $0`
REPOSITORY_NAME="cpp-template"

# include utility.sh
. ${PARENT_DIR}/utility.sh

SRC_DIR_NAME="src"

echo "Invoking "${PARENT_DIR}/${THIS_SCRIPT_NAME}

# create Makefile from script/template/Makefile
createMakefile()
{
    local MAKEFILE="Makefile"

    local PATH_2_MAKEFILE=${WORKING_DIR}/${MAKEFILE}

    # invoke from utility.sh
    deleteFile ${PATH_2_MAKEFILE}

    echo "Input your project name."

    read -p \>\  PROJECT_NAME

    # echo "Input author name."

    # read -p \>\  AUTHOR_NAME

    echo "Your project name is: "${PROJECT_NAME}
    # echo "Author name is: "${AUTHOR_NAME}

    echo "# Makefile for "${PROJECT_NAME} >${PATH_2_MAKEFILE}
    echo "" >>${PATH_2_MAKEFILE}
    echo "PROJECT_NAME = "${PROJECT_NAME} >>${PATH_2_MAKEFILE}

    while read LINE

    do
        echo ${LINE} >>${PATH_2_MAKEFILE}
    done < ${PARENT_DIR}/template/${MAKEFILE}

    echo "Created Makefile !"

    return
}

# delete .git directories
deleteDotGit()
{
    DOT_GIT_DIRS=`find ${WORKING_DIR} -name .git`
    for DOT_GIT_DIR in ${DOT_GIT_DIRS[@]}
    do
        # echo ${DOT_GIT_DIR}
        rm -rf ${DOT_GIT_DIR}
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

createMakefile

deleteDotGit

deleteScriptDir

touchReadme

exit 0
