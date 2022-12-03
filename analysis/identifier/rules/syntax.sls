(library (scheme-langserver analysis identifier rules syntax)
  (export syntax-process)
  (import 
    (chezscheme) 
    (ufo-match)

    (scheme-langserver util try)
    (scheme-langserver util contain)

    (scheme-langserver analysis identifier reference)

    (scheme-langserver virtual-file-system index-node)
    (scheme-langserver virtual-file-system document)
    (scheme-langserver virtual-file-system file-node))

; reference-identifier-type include 
; syntax-parameter 
;https://www.zenlife.tk/scheme-hygiene-macro.md
(define (syntax-process root-file-node document index-node)
  (let* ([ann (index-node-datum/annotations index-node)]
      [expression (annotation-stripped ann)])
    (try
      (match expression
        [('with-syntax ((pattern expression) **1) body ...)
          (guard-for document index-node 'with-syntax '(chezscheme) '(rnrs) '(rnrs base) '(scheme))
          (let* ([pattern-expression (cdr (index-node-children index-node))])
            (let loop ([children (index-node-children pattern-expression)])
              (if (not (null? children))
                (body 
                  (clause-process document (car children) index-node '())
                  (loop (cdr children))))))]
        [('syntax-rules (literals ...) (a b ...) **1) 
          (guard-for document index-node 'syntax-rules '(chezscheme) '(rnrs) '(rnrs base) '(scheme))
        ; https://www.scheme.com/tspl4/syntax.html
        ; Any syntax-rules form can be expressed with syntax-case by making the lambda expression and syntax expressions explicit.
          (let ([rest (cddr (index-node-children index-node))])
            ;(a b)
            (map (lambda (clause-index-node)
              (clause-process document clause-index-node clause-index-node literals))
              rest))]
        [('syntax-case to-match (literals ...) (a b ...) **1) 
          (guard-for document index-node 'syntax-case '(chezscheme) '(rnrs) '(rnrs base) '(scheme))
          (let ([rest (cdddr (index-node-children index-node))])
            ;(a b)
            (map (lambda (clause-index-node)
              (clause-process document clause-index-node clause-index-node literals))
              rest))]
        [else '()])
      (except c
        [else '()]))))

(define (clause-process document index-node target-index-node literals)
  (let* ([template-index-node (car (index-node-children index-node))]
      [ann (index-node-datum/annotations template-index-node)]
      [expression (annotation-stripped ann)]
      [symbols 
        (filter 
          (lambda (symbol)
            (not (contain? literals symbol)))
          (get-all-symbols expression))])
    (map 
      (lambda (symbol)
        (let ([reference 
              (make-identifier-reference
                expression
                document
                template-index-node
                '()
                'syntax-parameter)])
          (index-node-references-export-to-other-node-set! 
            template-index-node
            (append 
              (index-node-references-export-to-other-node template-index-node)
              `(,reference)))

          (index-node-references-import-in-this-node-set! 
            target-index-node
            (append 
              (index-node-references-import-in-this-node index-node)
              `(,reference)))
          reference))
      symbols)))

(define (get-all-symbols s-expression)
  (if (symbol? s-expression)
    `(,s-expression)
    (cond
      [(list? s-expression) (apply append (map get-all-symbols s-expression))]
      [(vector? s-expression) (apply append (vector->list (vector-map get-all-symbols s-expression)))]
      [else '()])))
)
