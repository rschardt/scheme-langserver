#!/usr/bin/env scheme-script
;; -*- mode: scheme; coding: utf-8 -*- !#
;; Copyright (c) 2022 WANG Zheng
;; SPDX-License-Identifier: MIT
#!r6rs

(import 
    ; (rnrs (6)) 
    (chezscheme) 
    (srfi :64 testing) 
    (scheme-langserver analysis type domain-specific-language inner-type-checker)
    (scheme-langserver analysis identifier meta))

(test-begin "inner:checkers")
    (test-equal #t (inner:list? '(inner:list?)))
    (test-equal #f (inner:trivial? '(inner:list? list?)))
    (test-equal #f (inner:trivial? '(inner:pair? )))
    (test-equal #t (inner:trivial? (construct-type-expression-with-meta 'number?)))
    (test-equal #t (inner:trivial? (construct-type-expression-with-meta '(inner:pair? number? number?))))
    (test-equal #t (inner:list? (construct-type-expression-with-meta '(inner:list? number? **1))))
    (test-equal #t (inner:list? (construct-type-expression-with-meta '(inner:list? number? ...))))
    (test-equal #t (inner:list? (construct-type-expression-with-meta '(inner:list? number? ... string? ...))))
    (test-equal #t (inner:list? (construct-type-expression-with-meta '(inner:list? number? **1 string? ...))))
    (test-equal #f (inner:trivial? (construct-type-expression-with-meta '(inner:pair? number?))))
    (test-equal #t (inner:lambda? (construct-type-expression-with-meta '(number? <- (inner:list? number? number?)))))
    (test-equal #t (inner:trivial? (construct-type-expression-with-meta '((number? <- (inner:list? number? number?)) number? number?))))
    (test-equal #t (inner:executable? (construct-type-expression-with-meta '((number? <- (inner:list? number? number?)) number? number?))))
    (test-equal 
        (construct-type-expression-with-meta '(inner:list? number? number? number?)) 
        (inner:with (construct-type-expression-with-meta '((with (a b c) (inner:list? a b c)) number? number? number?))))
    ; car list?
    (test-equal 
        (construct-type-expression-with-meta 'fixnum?) 
        (inner:with
            (construct-type-expression-with-meta 
                '((with 
                    ((a b c **1)) 
                    (with-equal? inner:list? a b))
                    (inner:list? fixnum? number?)))))
    ; cdr list?
    (test-equal 
        (construct-type-expression-with-meta '(inner:list? number? fixnum?)) 
        (inner:with
            (construct-type-expression-with-meta 
                '((with 
                    ((a b c **1 )) 
                    (with-equal? inner:list? a (with-append (inner:list?) c)))
                (inner:list? fixnum? number? fixnum?)))))
(test-end)

(exit (if (zero? (test-runner-fail-count (test-runner-get))) 0 1))
