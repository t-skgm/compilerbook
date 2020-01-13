#!/bin/bash

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

# try $expected $input
try 0 0
try 42 42
try 32 "10+23-1"

echo OK
