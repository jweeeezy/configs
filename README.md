# Introduction

This repository contains various templates, tools and configs for my workflow.

## Overview

| Directory          | Description |
| :----------------- | :---------- |
| cheatsheets/       | self-made cheatsheets of various types |
| docker-setups/     | self-made docker images of various types |
| dot-files/         | self-made config/dot files of various types |
| project-templates/ | self-made project templates that can be inserted via alias |
| tools/             | self-made tools that can automate various tasks |
| vim-scripts/       | self-made vim setup |

## Prerequisites

* Linux (tested on Ubuntu 22.04. WSL2)
* GNU Make
* Bash

## Get Started

>Following the `one source of truth` principle, installed files will mostly link
to the files in this repository. This ensures better consistency and easier maintainablity.

* Install .dotfiles on your system as symlinks, backup existing files.

   ```sh
   make install
   ```
