# Introduction

This repository contains various templates, tools and configs for my workflow.

## Overview

| Directory          | Description                                                |
|--------------------|------------------------------------------------------------|
| cheatsheets/       | self-made cheatsheets of various types                     |
| docker-setups/     | self-made docker images of various types                   |
| dotfiles/          | self-made dot files of various types                       |
| project-templates/ | self-made project templates that can be inserted via alias |
| tools/             | self-made tools that can automate various tasks            |
| vim-scripts/       | self-made vim setup                                        |

## Prerequisites

* Linux (tested on WSL2, Ubuntu 22.04. & Ubuntu 24.04)
* GNU Make
* Bash

## Get Started

>Following the `one source of truth` principle, installed files will be created
as symlinks to this repository. This ensures better consistency and easier maintainability.

* Install `dotfiles/` and some `tools/` on your system as symlinks in `/home/$USER/` or `/usr/local/bin/`, backup existing files.

   ```sh
   make install
   ```
