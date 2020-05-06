; I am a newbie.  I prefer simpler syntaxes.

(defpackage :un-utils.simple-syntax
  (:use :common-lisp)
  (:export
    #:for-each-$line-in #:$line #:print-line))

(in-package :un-utils.simple-syntax)

;
; Loop through the file input stream line by line.
;
; Intentional variable capture
;
;   $line - each line in the input stream
;
(defmacro for-each-$line-in (in-stream &rest body)
  `(let ($line)
     (loop for $line = (read-line ,in-stream nil 'eof)
       until (eq $line 'eof)
       do
     	   ,@body)))

; Print the specified text with a newline to *standard-output*
(defmacro print-line (formatted-string &rest args)
  `(format t ,(concatenate 'string formatted-string "~%") ,@args))
