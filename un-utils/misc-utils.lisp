(defpackage :un-utils.misc-utils
  (:use :common-lisp :cl-ppcre)
  (:export
    #:parse-decimal
    #:prompt-for-input
    #:utf16-to-char))

(in-package :un-utils.misc-utils)

; convert string into decimal
(defun parse-decimal (in-str)
  (with-input-from-string (in in-str)
    (read in)))
;
; Prompt for input from the command-line.  Input can be Lisp expression.  So, user can tamper with
; the program which can be a good or bad thing depending on the situation.
;
(defmacro prompt-for-input (prompt-message &optional var)
   `(progn
     (format t ,prompt-message)
     (finish-output)
     ,(if (null var)
       `(read-line)
       `(setf ,var (read-line)))))

; TODO
;
; convert utf-16 in the form of string representation (for example: "\u0061\u4e2d\u042f") into
; printed characters
(defun utf16-to-char (utf16-string)
  ; "\u0061" to #\u0061
  (format t "whatho: ~A" (coerce "#\u0e01" 'character)))
