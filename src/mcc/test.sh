#!/bin/bash

# try $expected $input
try() {
  expected="$1"
  input="$2"

  ./mcc "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

# step 1
try 0 0
try 42 42

# step 2
try 32 "10+23-1"

# step 3
try 41 " 12 + 34 - 5 "

echo OK
