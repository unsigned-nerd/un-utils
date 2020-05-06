; {{{ boilerplate
; load tools that will help us code easier
(load "~/quicklisp/setup.lisp") ; tool to load external systems
(require "asdf") ; tool to load local systems

(asdf:load-system "un-utils")
(use-package :un-utils.simple-syntax) ; always use simple-syntax because we are newbies
; }}}

(for-each-$line-in *standard-input*
  (print-line "each line is: ~A" $line))
