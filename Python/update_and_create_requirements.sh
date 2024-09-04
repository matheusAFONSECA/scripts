#!/bin/bash

# update requirements file
if [[ "$VIRTUAL_ENV" != "" ]]
then
  pip3 freeze > requirements.txt 
else
  echo "Not working in virtual env, skipping requirements update" 
fi