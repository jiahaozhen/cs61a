(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (if (null? pairs) (list nil nil)
  (cons (cons (caar pairs) (car (zip (cdr pairs)))) (list (cons (car (cdar pairs)) (cadr (zip (cdr pairs))))))
  )
  ;'replace-this-line
)


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  'replace-this-line
  (define (enumerate_start_at_k s k)
          (if (null? s) nil (cons (list k (car s)) (enumerate_start_at_k (cdr s) (+ k 1)))))
  (enumerate_start_at_k s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  'replace-this-line
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else
      (if (comp (car list1) (car list2))
      (cons (car list1) (merge comp (cdr list1) list2))
      (cons (car list2) (merge comp list1 (cdr list2)))))
  )
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    'replace-this-line
    (cond ((null? (cdr s)) (list s))
    ((> (car s) (cadr s)) (cons (list (car s)) (nondecreaselist (cdr s))))
    (else (define new_s (nondecreaselist (cdr s))) (cons (cons (car s) (car new_s)) (cdr new_s)))
    )
    )
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
           (define parameter (car (zip values)))
           (define input (cadr (zip values)))
           (cons (cons 'lambda (cons parameter (map let-to-lambda body))) (map let-to-lambda input))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         'replace-this-line
          (map let-to-lambda expr)
         ; END PROBLEM EC
         )))

