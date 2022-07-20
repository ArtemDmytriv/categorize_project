#!/bin/bash

if [[ ! -f ".curworkdir" && $# -gt 0 ]]; then
    echo $1 > .curworkdir
fi

arg=""
if [ -f ".curworkdir" ]; then
    arg=$(cat .curworkdir)
fi

git submodule update --init $arg
git submodule foreach -q --recursive 'git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)'
