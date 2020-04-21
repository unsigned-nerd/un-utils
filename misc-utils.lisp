; to use this package, you have to load :cl-ppcre system from quicklisp first
(defpackage :un-utils/misc-utils
  (:use :common-lisp :cl-ppcre)
  (:export
    #:parse-decimal
    #:print-line
    #:prompt-for-input
    #:utf16-to-char
    #:time-periods-to-minutes))

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

; TODO
;
; convert utf-16 in the form of string representation (for example: "\u0061\u4e2d\u042f") into
; printed characters
(defun utf16-to-char (utf16-string)
  ; "\u0061" to #\u0061
  (format t "whatho: ~A" (coerce "#\u0e01" 'character)))

; take an input string like this:
;
;    12:08-14:05, 15:07-18:20
;
; and convert it into minutes like the result of the calculation below:
;
;   (13-12)*60+(60-8)+5+(18-15)*60 + (18-15)*60+(20-7) == 490 minutes
;
(defun time-periods-to-minutes (time-period-string)
  ; (cl-ppcre:split "[\\s]*,[\\s]*" time-period-string), for example,
  ; converts "12:08-14:05, 15:07-18:20" into ("12:08-14:05" "15:07-18:20")
  (loop for x in (cl-ppcre:split "[\\s]*,[\\s]*" time-period-string)
     do
       (cl-ppcre:register-groups-bind (start-time end-time) ((cl-ppcre:create-scanner "(.*)-(.*)") x :sharedp t)
	 (format t "~a ! ~a~%" start-time end-time))))
