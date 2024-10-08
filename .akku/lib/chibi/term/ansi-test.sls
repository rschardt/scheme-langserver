#!r6rs
;; Akku.scm wrote this file based on "chibi-term-ansi-0.9.0/chibi/term/ansi-test.sld"
(library
  (chibi term ansi-test)
  (export run-tests)
  (import
    (scheme base)
    (scheme write)
    (chibi term ansi))
  (define-syntax test
    (syntax-rules ()
      ((test expect expr) (test 'expr expect expr))
      ((test name expect expr)
       (guard (exn (else (display "!\nERROR: ")
                         (write name)
                         (newline)
                         (write exn)
                         (newline)))
              (let* ((res expr) (pass? (equal? expect expr)))
                (display (if pass? "." "x"))
                (cond ((not pass?)
                       (display "\nFAIL: ")
                       (write name)
                       (newline))))))))
  (define-syntax test-assert
    (syntax-rules ()
      ((test-assert expr) (test #t expr))))
  (define-syntax test-error
    (syntax-rules ()
      ((test-error expr)
       (test-assert (guard (exn (else #t)) expr #f)))))
  (define-syntax test-escape-procedure
    (syntax-rules ()
      ((test-escape-procedure p s)
       (begin (test-assert (procedure? p)) (test s (p))))))
  (define-syntax test-wrap-procedure
    (syntax-rules ()
      ((test-wrap-procedure p s)
       (begin
         (test-assert (procedure? p))
         (test (p "FOO")
               "FOO"
               (parameterize
                 ((ansi-escapes-enabled? #f))
                 (p "FOO")))
         (test (p "FOO")
               s
               (parameterize
                 ((ansi-escapes-enabled? #t))
                 (p "FOO")))))))
  (define (test-begin name) (display name))
  (define (test-end) (newline))
  (define (run-tests)
    (test-begin "term.ansi")
    (test-assert (procedure? ansi-escapes-enabled?))
    (test-assert
      (let ((tag (cons #t #t)))
        (eqv? tag
              (parameterize
                ((ansi-escapes-enabled? tag))
                (ansi-escapes-enabled?)))))
    (test-escape-procedure black-escape "\x1b;[30m")
    (test-escape-procedure red-escape "\x1b;[31m")
    (test-escape-procedure green-escape "\x1b;[32m")
    (test-escape-procedure yellow-escape "\x1b;[33m")
    (test-escape-procedure blue-escape "\x1b;[34m")
    (test-escape-procedure cyan-escape "\x1b;[36m")
    (test-escape-procedure
      magenta-escape
      "\x1b;[35m")
    (test-escape-procedure white-escape "\x1b;[37m")
    (test-escape-procedure
      reset-color-escape
      "\x1b;[39m")
    (test-assert (procedure? rgb-escape))
    (test-error (rgb-escape))
    (test-error (rgb-escape 0))
    (test-error (rgb-escape 0 0))
    (test-error (rgb-escape 0 0 0 0))
    (test-error (rgb-escape 0.0 0 0))
    (test-error (rgb-escape 0 0.0 0))
    (test-error (rgb-escape 0 0 0.0))
    (test-error (rgb-escape -1 0 0))
    (test-error (rgb-escape 0 -1 0))
    (test-error (rgb-escape 0 0 -1))
    (test-error (rgb-escape 6 0 0))
    (test-error (rgb-escape 0 6 0))
    (test-error (rgb-escape 0 0 6))
    (test-escape-procedure
      (lambda () (rgb-escape 0 0 0))
      "\x1b;[38;5;16m")
    (test-escape-procedure
      (lambda () (rgb-escape 5 0 0))
      "\x1b;[38;5;196m")
    (test-escape-procedure
      (lambda () (rgb-escape 0 5 0))
      "\x1b;[38;5;46m")
    (test-escape-procedure
      (lambda () (rgb-escape 0 0 5))
      "\x1b;[38;5;21m")
    (test-escape-procedure
      (lambda () (rgb-escape 1 1 1))
      "\x1b;[38;5;59m")
    (test-escape-procedure
      (lambda () (rgb-escape 2 2 2))
      "\x1b;[38;5;102m")
    (test-escape-procedure
      (lambda () (rgb-escape 3 3 3))
      "\x1b;[38;5;145m")
    (test-escape-procedure
      (lambda () (rgb-escape 4 4 4))
      "\x1b;[38;5;188m")
    (test-escape-procedure
      (lambda () (rgb-escape 5 5 5))
      "\x1b;[38;5;231m")
    (test-escape-procedure
      (lambda () (rgb-escape 1 3 5))
      "\x1b;[38;5;75m")
    (test-escape-procedure
      (lambda () (rgb-escape 5 1 3))
      "\x1b;[38;5;205m")
    (test-escape-procedure
      (lambda () (rgb-escape 3 5 1))
      "\x1b;[38;5;155m")
    (test-assert (procedure? gray-escape))
    (test-error (gray-escape))
    (test-error (gray-escape 0 0))
    (test-error (gray-escape 0.0))
    (test-error (gray-escape -1))
    (test-error (gray-escape 24))
    (test-escape-procedure
      (lambda () (gray-escape 0))
      "\x1b;[38;5;232m")
    (test-escape-procedure
      (lambda () (gray-escape 23))
      "\x1b;[38;5;255m")
    (test-escape-procedure
      (lambda () (gray-escape 12))
      "\x1b;[38;5;244m")
    (test-wrap-procedure
      black
      "\x1b;[30mFOO\x1b;[39m")
    (test-wrap-procedure red "\x1b;[31mFOO\x1b;[39m")
    (test-wrap-procedure
      green
      "\x1b;[32mFOO\x1b;[39m")
    (test-wrap-procedure
      yellow
      "\x1b;[33mFOO\x1b;[39m")
    (test-wrap-procedure
      blue
      "\x1b;[34mFOO\x1b;[39m")
    (test-wrap-procedure
      cyan
      "\x1b;[36mFOO\x1b;[39m")
    (test-wrap-procedure
      magenta
      "\x1b;[35mFOO\x1b;[39m")
    (test-wrap-procedure
      white
      "\x1b;[37mFOO\x1b;[39m")
    (test-wrap-procedure
      (rgb 0 0 0)
      "\x1b;[38;5;16mFOO\x1b;[39m")
    (test-wrap-procedure
      (rgb 5 5 5)
      "\x1b;[38;5;231mFOO\x1b;[39m")
    (test-wrap-procedure
      (gray 0)
      "\x1b;[38;5;232mFOO\x1b;[39m")
    (test-wrap-procedure
      (gray 23)
      "\x1b;[38;5;255mFOO\x1b;[39m")
    (test-wrap-procedure
      (rgb24 166 123 91)
      "\x1b;[38;2;166;123;91mFOO\x1b;[39m")
    (test-escape-procedure
      black-background-escape
      "\x1b;[40m")
    (test-escape-procedure
      red-background-escape
      "\x1b;[41m")
    (test-escape-procedure
      green-background-escape
      "\x1b;[42m")
    (test-escape-procedure
      yellow-background-escape
      "\x1b;[43m")
    (test-escape-procedure
      blue-background-escape
      "\x1b;[44m")
    (test-escape-procedure
      cyan-background-escape
      "\x1b;[46m")
    (test-escape-procedure
      magenta-background-escape
      "\x1b;[45m")
    (test-escape-procedure
      white-background-escape
      "\x1b;[47m")
    (test-escape-procedure
      reset-background-color-escape
      "\x1b;[49m")
    (test-assert (procedure? rgb-background-escape))
    (test-error (rgb-background-escape))
    (test-error (rgb-background-escape 0))
    (test-error (rgb-background-escape 0 0))
    (test-error (rgb-background-escape 0 0 0 0))
    (test-error (rgb-background-escape 0.0 0 0))
    (test-error (rgb-background-escape 0 0.0 0))
    (test-error (rgb-background-escape 0 0 0.0))
    (test-error (rgb-background-escape -1 0 0))
    (test-error (rgb-background-escape 0 -1 0))
    (test-error (rgb-background-escape 0 0 -1))
    (test-error (rgb-background-escape 6 0 0))
    (test-error (rgb-background-escape 0 6 0))
    (test-error (rgb-background-escape 0 0 6))
    (test-escape-procedure
      (lambda () (rgb-background-escape 0 0 0))
      "\x1b;[48;5;16m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 5 0 0))
      "\x1b;[48;5;196m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 0 5 0))
      "\x1b;[48;5;46m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 0 0 5))
      "\x1b;[48;5;21m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 1 1 1))
      "\x1b;[48;5;59m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 2 2 2))
      "\x1b;[48;5;102m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 3 3 3))
      "\x1b;[48;5;145m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 4 4 4))
      "\x1b;[48;5;188m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 5 5 5))
      "\x1b;[48;5;231m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 1 3 5))
      "\x1b;[48;5;75m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 5 1 3))
      "\x1b;[48;5;205m")
    (test-escape-procedure
      (lambda () (rgb-background-escape 3 5 1))
      "\x1b;[48;5;155m")
    (test-assert (procedure? gray-background-escape))
    (test-error (gray-background-escape))
    (test-error (gray-background-escape 0 0))
    (test-error (gray-background-escape 0.0))
    (test-error (gray-background-escape -1))
    (test-error (gray-background-escape 24))
    (test-escape-procedure
      (lambda () (gray-background-escape 0))
      "\x1b;[48;5;232m")
    (test-escape-procedure
      (lambda () (gray-background-escape 23))
      "\x1b;[48;5;255m")
    (test-escape-procedure
      (lambda () (gray-background-escape 12))
      "\x1b;[48;5;244m")
    (test-wrap-procedure
      black-background
      "\x1b;[40mFOO\x1b;[49m")
    (test-wrap-procedure
      red-background
      "\x1b;[41mFOO\x1b;[49m")
    (test-wrap-procedure
      green-background
      "\x1b;[42mFOO\x1b;[49m")
    (test-wrap-procedure
      yellow-background
      "\x1b;[43mFOO\x1b;[49m")
    (test-wrap-procedure
      blue-background
      "\x1b;[44mFOO\x1b;[49m")
    (test-wrap-procedure
      cyan-background
      "\x1b;[46mFOO\x1b;[49m")
    (test-wrap-procedure
      magenta-background
      "\x1b;[45mFOO\x1b;[49m")
    (test-wrap-procedure
      white-background
      "\x1b;[47mFOO\x1b;[49m")
    (test-wrap-procedure
      (rgb-background 0 0 0)
      "\x1b;[48;5;16mFOO\x1b;[49m")
    (test-wrap-procedure
      (rgb-background 5 5 5)
      "\x1b;[48;5;231mFOO\x1b;[49m")
    (test-wrap-procedure
      (gray-background 0)
      "\x1b;[48;5;232mFOO\x1b;[49m")
    (test-wrap-procedure
      (gray-background 23)
      "\x1b;[48;5;255mFOO\x1b;[49m")
    (test-escape-procedure bold-escape "\x1b;[1m")
    (test-escape-procedure
      reset-bold-escape
      "\x1b;[22m")
    (test-wrap-procedure bold "\x1b;[1mFOO\x1b;[22m")
    (test-escape-procedure
      underline-escape
      "\x1b;[4m")
    (test-escape-procedure
      reset-underline-escape
      "\x1b;[24m")
    (test-wrap-procedure
      underline
      "\x1b;[4mFOO\x1b;[24m")
    (test-escape-procedure
      negative-escape
      "\x1b;[7m")
    (test-escape-procedure
      reset-negative-escape
      "\x1b;[27m")
    (test-wrap-procedure
      negative
      "\x1b;[7mFOO\x1b;[27m")
    (test-end)))
