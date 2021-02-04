#!/usr/bin/bash

# Configuration stuff

fspec=$1
num_files=6

# Work out lines per file.

total_lines=$(wc -l <${fspec})
((lines_per_file = (total_lines + num_files - 1) / num_files))

# Split the actual file, maintaining lines.

split --numeric-suffixes --suffix-length=1 --lines=${lines_per_file} ${fspec} part

# Debug information

echo "Total lines     = ${total_lines}"
echo "Lines  per file = ${lines_per_file}"    
wc -l part*
