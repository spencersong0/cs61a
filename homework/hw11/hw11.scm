(define (find s predicate)
  (if
    (null? s)
    #f
    (if
      (predicate (car s))
      (car s)
      (find (force (cdr s)) predicate)
    )
  )
)

(define (scale-stream s k)
  (cond
    ((null? s) nil)
    (else (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k)))
  )
)

(define (has-cycle s)
  (define (has-cycle-h s x)
    (cond
      ((null? s) #f)
      ((find x (lambda (t) (eq? t s))) #t)
      (else
        (has-cycle-h (cdr-stream s) (cons-stream s x))
      )
    )
  )
  (has-cycle-h s nil)
)
(define (has-cycle-constant s)
  
)
