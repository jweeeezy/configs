# Python Code
*"everything in python is an object"*

` import this ` (for python ethics)

## general
- check truthiness with ` is ` for ` None, True, False ` or ` bool() `
- use context managers like ` with open("some_file") as file: `
- use ` from module import function ` instead of ` import module `
- use ` enumerate() ` for indexing in a loop
- ` for element in elements ` --> element will survive scope as elements[-1]

| command | description |
| :-------------- | :----------- |
| ` help() ` | shows documentation of given object
| ` type() ` | checks type of given parameter (variable / value)
| ` dir() ` | shows all available methods of given type
| ` hash() ` | checks for mutability
| ` isinstance() ` | checks if an object is an instance
| ` issubclass() ` | checks if an object is a subclass of another object

## testing
- ` import unittest ` (part of python standard lib)

| command | description |
| :-------------- | :----------- |
| ` assert() ` | |

## str
| command | description |
| :-------------- | :----------- |
| ` "some_string" ` | string, immutable
| ` str(5) ` | string constructor / converter
| ` " - ".join(some_list) ` | will create a string like this: "name - other_name"
| ` some_str[:] ` | slices from beginning to end and returns new str
| ` some_str[-1] ` | returns last char

## List
| command | description |
| :-------------- | :----------- |
| ` [] ` | list - mutable
| ` [ len(name) for name in names if name == "Max"] ` | list comprehension, returns result list

## Tuple
| command | description |
| :-------------- | :----------- |
| ` (,) ` | tuple - immutable, can't contain mutable types
| ` name, age, address = my_tuple ` | unpacks tuple into variables

## Set
| command | description |
| :-------------- | :----------- |
| ` set() ` | set - mutable, can't contain duplicate items, mutable types, not sorted

## Dictionary
| command | description |
| :-------------- | :----------- |
| ` {:} ` | dictionary - mutable, not sorted
| ` .get("value", "default") ` | returns value no exception, can be defaulted
| ` .keys() ` | shows all keys
| ` .items() ` | shows all keys + values
| ` .pop() ` | deletes (last or given) value, can be defaulted for no exception

### Class
| command | description |
| :-------------- | :----------- |
| ` def Class(Parent_class): `| inherits Parent_class for Class
| ` super() ` | calls the super (or Parent) class
| ` __init__(self) ` | method for initialising via constructor
| ` __str__(self) ` | string representation of that class instance
| ` __repr__(self) ` | *under the hood* representation of that class instance
