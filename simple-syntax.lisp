; I am a newbie.  I don't feel comfortable with the loop macro yet.

(defpackage :un-utils/simple-syntax
  (:use :common-lisp)
  (:export
    #:for-line))

(in-package :un-utils/simple-syntax)

; Return a code to loop through the text file input stream line by line.  Each line is set to the
; variable specified by `line`
(defmacro for-line (line in-stream &rest body)
  `(loop for ,line = (read-line ,in-stream nil 'eof)
     until (eq ,line 'eof)
     do
     	,@body))
