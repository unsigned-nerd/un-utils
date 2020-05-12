(defpackage :un-utils.misc-utils
  (:use :common-lisp :cl-ppcre)
  (:export
    #:parse-decimal
    #:prompt-for-input
    #:utf16-to-char
    #:with-interned-symbols))

(in-package :un-utils.misc-utils)

;
; Convert string into decimal.  in-str can be a Lisp expression.  So, user can tamper with the
; program which can be a good or bad thing depending on the situation.
;
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

;
; When we write a macro that is an anaphoric macro, use with-interned-symbols to intern all symbols
; that will be available to the caller.  This will solve problem that comes from the usage of
; package.
;
; https://stackoverflow.com/questions/44199651/exporting-anaphoric-macros-in-common-lisp-packages
;
(defmacro with-interned-symbols (symbol-list &body body)
  "Interns a set of symbols in the current package to variables of the same (symbol-name)."
  (let ((symbol-list (mapcar (lambda (s) (list s `(intern (symbol-name ',s)))) symbol-list)))
    `(let ,symbol-list ,@body)))
