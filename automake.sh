#!/bin/bash

# Update the pdf whenever a file is updated in the current directory
while true; do
    inotifywait -e close_write,moved_to,create .

    make
done
