(defpackage :un-utils/misc-utils
  (:use :common-lisp)
  (:export
    #:parse-decimal
    #:print-line
    #:prompt-for-input))

(in-package :un-utils/misc-utils)

; convert string into decimal
(defun parse-decimal (in-str)
  (with-input-from-string (in in-str)
    (read in)))

; print the specified text with a newline
(defun print-line (text)
  (format t "~A~%" text))

; prompt for input from the command-line
(defmacro prompt-for-input (prompt-message &optional var)
   `(progn
     (format t ,prompt-message)
     (finish-output)
     ,(if (null var)
       `(read-line)
       `(setf ,var (read-line)))))
