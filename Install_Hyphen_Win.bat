#!/bin/bash

#This script is for windows 10, runs up to line NN, assuming python3 and Haskell are already installed
#Also assuming we don't need to build a .a file. That'll take a bit longer.

#Ensure we can cabal install
echo "Get the stuff we need to do a Cabal install"
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true
#That's long. I got it from here https://www.haskell.org/ghcup/#


#move to the file the python things are in
cd hyphen
echo "building hyphen"
build-extn.py
echo "Testing Hyphen"
cd ..
python3 hyphen_examples.py
echo "done"