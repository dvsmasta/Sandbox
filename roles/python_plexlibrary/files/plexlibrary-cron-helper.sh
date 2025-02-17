#!/bin/bash
#########################################################################
# Title:         Sandbox: Python-PlexLibrary Cron Helper Script         #
# Author(s):     desimaniac                                             #
# URL:           https://github.com/saltyorg/Sandbox                    #
# --                                                                    #
#########################################################################
#                   GNU General Public License v3.0                     #
#########################################################################

PATH='/usr/bin:/bin:/usr/local/bin'
export PYTHONIOENCODING=UTF-8

PYTHON_PATH='/opt/python-plexlibrary/venv/bin/python3'
LOG_PATH='/opt/python-plexlibrary/plexlibrary-cron.log'
RECIPES_PATH='/opt/python-plexlibrary/recipes'
SCRIPT_PATH='/opt/python-plexlibrary/plexlibrary/plexlibrary.py'

echo $(date) | tee -a $LOG_PATH
echo "" | tee -a $LOG_PATH

for file in $RECIPES_PATH/*
do
    if [ -f "${file}" ]; then
        $PYTHON_PATH $SCRIPT_PATH $(basename "$file" .yml) | tee -a $LOG_PATH
        echo "" | tee -a $LOG_PATH
    fi
done
