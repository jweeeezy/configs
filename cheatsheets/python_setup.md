# Python Setup

## environment
| command | description |
| :-------------- | :----------- |
| ` python3 -m venv env ` | creates a virtual environment
| ` source env/bin/activate ` | sources the virtual environment

## package manager
- ` http://www.pypi.com ` for external libraries
- use ` requirements.txt ` for a log of dependencies

| command | description |
| :-------------- | :----------- |
| (env) $: ` python -m pip search some_module ` | cli-tool to search for libs on pypi
| (env) $: ` python -m pip install some_module` | cli-tool to install libs from pypi
| (env) $: ` python -m pip freeze > requirements.txt ` | log all installed libs to file
| (env) $: ` python -m pip install -r requirements.txt ` | install all logged libs from file

## .gitignore
- *.pyc
- pycache

## VSCode extensions
-   Python
-   Pylance
-   Python Debugger

## Frameworks

### Django

#### Migrations
| command | description |
| :-------------- | :----------- |
| (env) $: ` python manage.py makemigrations ` |
| (env) $: ` python manage.py migrate ` |
| (env) $: ` python manage.py shell ` |
