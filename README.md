# un-utils

My common lisp utilities

# INSTALL

On Debian 10,

Install Sbcl, if you haven't done that already:

```
$ sudo apt-get install sbcl
```

Install Quicklisp, if you haven't done that already:

```
$ curl -O https://beta.quicklisp.org/quicklisp.lisp
$ sbcl --load quicklisp.lisp
* (quicklisp-quickstart:install)
* (ql:quickload "cl-ppcre")
* (ql:add-to-init-file)
* (quit)
```

Install un-utils:

```
$ mkdir ~/common-lisp
$ cd ~/common-lisp
$ git clone https://github.com/unsigned-nerd/un-utils.git
$ sbcl
* (asdf:load-system "un-utils")
* (un-utils.simple-syntax:print-line "hello world!")
```
