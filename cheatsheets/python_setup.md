# Python Setup

## environment
| command | description |
| :-------------- | :----------- |
| ` python3 -m venv env ` | creates a virtual environment
| ` source env/bin/activate ` | sources the virtual environment

## package manager
- ` http://www.pypi.com ` for external libraries
-   rye
-   poetry

| command | description |
| :-------------- | :----------- |
| (env) $: ` python -m pip search some_module ` | cli-tool to search for libs
| (env) $: ` python -m pip install some_module` | cli-tool to install libs
| (env) $: ` python -m pip freeze > requirements.txt ` | log all installed libs
| (env) $: ` python -m pip install -r requirements.txt ` | install all listed libs

## Files
| ` __init__.py ` | empty file that marks a python package
| ` requirements.txt` | list of project-specific dependencies

## .gitignore
https://djangowaves.com/tips-tricks/gitignore-for-a-django-project/

## VSCode extensions
-   Python
-   Pylance
-   Python Debugger

## Frameworks

### Django

#### Setup
| command | description |
| :-------------- | :----------- |
| ` django-admin startproject mysite ` | creates a django project
| (mysite/) $: ` python manage.py runserver ` | starts project on localhost
| (mysite/) $: ` python manage.py startapp polls ` | creates new application <polls>

#### Testing
- files that match test*.py are run
`
import django.test import TestCase

class SomeTestCaseClass(TestCase):

    def setUpTestData(cls):
        # setup the class data (each test suite)

    def setUp(self):
        # setup the class instance (each test)

    def test_case_one:
        # define steps for a test case
`

#### Files (project)
| file | description |
| :-------------- | :----------- |
| ` mysite/` | root / outer directory for django project
| ` mysite/manage.py ` | command-line-utility to interact with mysite
| ` mysite/mysite/ ` |  dir of actual python package, that needs to be imported
| ` mysite/mysite/settings.py ` | config file for the mysite package/project
| ` mysite/mysite/urls.py ` | URL / table of contents for the project
| ` mysite/mysite/asgi.py ` | entry point for asgi-compatible webservers
| ` mysite/mysite/wsgi.py ` | entry point for asgi-compatible webservers

#### Files (app)
| file | description |
| :-------------- | :----------- |
| ` polls/` | root / outer directory for django application
| ` polls/admin.py ` |
| ` polls/apps.py ` |
| ` polls/migrations.py ` |
| ` polls/models.py ` |
| ` polls/tests.py ` |
| ` polls/views.py ` |

#### Create a view
- define a function in polls/views.py like:

` def index(request):
    return HttpResponse("Hello!")
`

- add a path to the urlpatters list in polls/urls.py

` urlpatterns = [
    path("", views.index, name="index"),
]
`

- add a path to the urlpatterns of mysite/urls.py

` urlpatterns = [
    path("polls/", include("polls.urls")),
]
`

#### Migrations
| command | description |
| :-------------- | :----------- |
| (env) $: ` python manage.py makemigrations ` |
| (env) $: ` python manage.py migrate ` |
| (env) $: ` python manage.py shell ` |
