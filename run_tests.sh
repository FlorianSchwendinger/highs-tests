#!/bin/bash

prob_dir="./lp"
highs_output_dir="$HOME/highs-output"
highs="$HOME/highslib/bin/highs"

mkdir -p $highs_output_dir

for file_path in "$prob_dir"/*
do
  if [ -f "$file_path" ]; then
    file_name=$(basename "$file_path")
    echo "Run $file_path"
    $highs $file_path &> $highs_output_dir/$file_name.out
  fi
done
