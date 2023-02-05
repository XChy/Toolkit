#!/usr/bin/env bash

find . -not -name "update.sh" -exec rm -rf {} \;
cp -r ~/.SpaceVim.d/ ./
mkdir .SpaceVim
cp ~/.SpaceVim/coc-settings.json ./.SpaceVim/
