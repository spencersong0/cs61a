(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner
        (accumulate combiner start (- n 1) term)
        (term n)
      )
  )
)

(define (accumulate-tail combiner start n term)
  (define (helper combiner start n term total)
    (if (= n (- start 1))
      total
    (helper combiner (+ start 1) n term (combiner total (term start)))
    )
  )
  (helper combiner start n term start)
)

(define-macro (list-of expr for var in seq if filter-fn)
  (list 'map
    (list 'lambda
      (list var)
      expr)
  (list 'filter
    (list 'lambda
      (list var)
      filter-fn)
    seq))
)
