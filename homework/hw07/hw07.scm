(define (filter-lst fn lst)
  'YOUR-CODE-HERE
  (if (null? lst)
    ()
    (if (fn (car lst))
      (cons (car lst) (filter-lst fn (cdr lst)))
      (filter-lst fn (cdr lst))))
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  'YOUR-CODE-HERE
  (if (null? first)
    second
    (cons (car first) (interleave second (cdr first)))
  )
  
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 1)
    (combiner start (term n))
    (combiner (term n) (accumulate combiner start (- n 1) term)))
)


(define (no-repeats lst)
  'YOUR-CODE-HERE
  (if (null? lst)
    ()
    (cons (car lst) 
      (no-repeats 
        (filter-lst (lambda (x) (not (= x (car lst)))) (cdr lst)))))
)

