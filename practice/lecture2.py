Last login: Thu Jan 18 17:57:36 on ttys000
$ ~ > python3
Python 3.6.4 (v3.6.4:d48ecebad5, Dec 18 2017, 21:07:28) 
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> add(1,2)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'add' is not defined
>>> from operator import add, mul
>>> add(1,2)
3
>>> max
<built-in function max>
>>> max(4,3)
4
>>> from math import pi
>>> pi
3.141592653589793
>>> f = max
>>> f(4,3)
4
>>> 

