#!/bin/bash

prob_dir="./lp"
out_dir="./out_$(date +"%Y-%m-%d")"
highs="$HOME/highslib/bin/highs"

mkdir -p $out_dir

for file_path in "$prob_dir"/*
do
  if [ -f "$file_path" ]; then
    file_name=$(basename "$file_path")
    echo "Run $file_path"
    $highs $file_path &> $out_dir/$file_name.out
  fi
done
