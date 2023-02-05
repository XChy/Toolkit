#!/usr/bin/env bash

find . -not -name "update.sh" -exec rm -rf {} \;
cp ~/.clang-format ./
