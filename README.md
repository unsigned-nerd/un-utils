# un-utils

My common lisp utilities

# INSTALL

On Debian 9,

```
$ sudo apt-get install sbcl
$ mkdir ~/common-lisp
$ sbcl

(require "asdf")
(require "un-utils")
(un-utils.misc-utils:print-line "hello world!")
```
