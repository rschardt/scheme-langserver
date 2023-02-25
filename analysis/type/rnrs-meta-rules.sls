(library (scheme-langserver analysis type rnrs-meta-rules)
  (export rnrs-chez-rules)
  (import 
    (chezscheme)
    (scheme-langserver util natural-order-compare))

(define rnrs-chez-rules (sort 
  (lambda (target1 target2)
    (natural-order-compare 
      (symbol->string (car target1))
      (symbol->string (car target2))))
  '(
(abort void?())
(abort void? (something?))
(abort-handler boolean?())
(add-duration something?())
(add-prefix something?())
(alias something?())
(alias something?())
(andmap boolean? (procedure? list? **1))
(annotation-expression something? (annotation?))
(annotation-options something? (annotation?))
(annotation-source something? (annotation?))
(annotation-stripped something? (annotation?))
(apropos (integer? x)())
(apropos (number? x)())
(ash integer? (integer? integer?))
(assert number?())
(atan number? (real? real?))
(call-with-bytevector-output-port void? (procedure?))
(call-with-bytevector-output-port void? (procedure? transcoder?))
(call-with-current-continuation something? (procedure?))
(call-with-input-file void? (string? procedure?))
(call-with-input-file something?())
(call-with-output-file something?())
(call/1cc something? (procedure?))
(call/cc something? (procedure?))
(char- integer? (char? char?))
(char- boolean? (char? char?))
(char-general-category symbol? (char?))
(char-name char? (symbol?))
(char-name boolean? (char?))
(char-name symbol? (string? char?))
(char-titlecase char? (char?))
(char-upcase char? (char?))
(chmod (number? x)())
(conjugate number? (number?))
(decode-float vector? (flonum?))
(display void? (something? textual-output-port?))
(display-condition void? (something? textual-output-port?))
(display-statistics void?())
(display-statistics void? (textual-output-port?))
(display-string void? (string?))
(display-string void? (string? textual-output-port?))
(div0 number? (number? number?))
(div0-and-mod0 number? (number? number?))
(open-bytevector-input-port input-port? (bytevector?))
(open-bytevector-input-port binary-port? (bytevector?))
(open-bytevector-input-port input-port? (bytevector? transcoder?))
(open-bytevector-input-port binary-port? (bytevector? transcoder?))
(open-bytevector-output-port binary-port?())
(open-bytevector-output-port output-port?())
(make-annotation annotation?())
(make-annotation annotation?())
(syntax->annotation annotation? (something?))
(make-assertion-violation boolean?())
(< boolean? (real? real? **1))
(<= boolean? (real? real? **1))
(= boolean? (number? ...))
(> boolean? (real? real? **1))
(>= boolean? (real? real? **1))
(annotation? boolean? (something?))
(assertion-violation? boolean? (something?))
(atom? boolean? (something?))
(bignum? boolean?())
(binary-port? boolean? (something?))
(bitwise-bit-set? boolean?())
(boolean=? boolean?())
(boolean? boolean? (something?))
(bound-identifier=? boolean?())
(box? boolean? (something?))
(bwp-object? boolean? (something?))
(bytevector=? boolean? (bytevector? bytevector?))
(bytevector? boolean? (something?))
(cflonum? boolean?())
(char-alphabetic? boolean?())
(char-ci<=? boolean?())
(char-ci<=? boolean?())
(char-ci<? boolean?())
(char-ci<? boolean?())
(char-ci=? boolean?())
(char-ci=? boolean?())
(char-ci>=? boolean?())
(char-ci>=? boolean?())
(char-ci>? boolean?())
(char-ci>? boolean?())
(char-lower-case? boolean?())
(char-numeric? boolean?())
(char-ready? boolean?())
(char-ready? boolean?())
(char-title-case? boolean?())
(char-upper-case? boolean?())
(char-whitespace? boolean?())
(char<=? boolean?())
(char<=? boolean?())
(char<? boolean?())
(char<? boolean?())
(char=? boolean?())
(char=? boolean?())
(char>=? boolean?())
(char>=? boolean?())
(char>? boolean?())
(char>? boolean?())
(char? boolean? (something?))
(compile-time-value? boolean? (something?))
(complex? boolean? (something?))
(condition? boolean? (something?))
(continuation-condition? boolean? (something?))
(cost-center? boolean? (something?))
(date-dst? boolean?())
(date? boolean? (something?))
(directory-separator? boolean?())
(enum-set-member? boolean?())
(enum-set-subset? boolean?())
(enum-set=? boolean?())
(enum-set? boolean?())
(environment-mutable? boolean?())
(environment? boolean? (something?))
(eof-object? boolean? (something?))
(ephemeron-pair? boolean? (something?))
(eq-hashtable-contains? boolean?())
(eq-hashtable-ephemeron? boolean?())
(eq-hashtable-weak? boolean?())
(eq-hashtable? boolean? (something?))
(eq? boolean? (something?))
(equal? boolean? (something?))
(eqv? boolean? (something?))
(error? boolean? (something?))
(even? boolean?())
(exact? boolean? (number?))
(file-directory? boolean?())
(file-directory? boolean?())
(file-exists? boolean?())
(file-exists? boolean?())
(file-port? boolean?())
(file-regular? boolean?())
(file-regular? boolean?())
(file-symbolic-link? boolean?())
(finite? boolean? (real?))
(fixnum? boolean?())
(fl<=? boolean?())
(fl<? boolean?())
(fl=? boolean?())
(fl>=? boolean?())
(fl>? boolean?())
(fleven? boolean?())
(flfinite? boolean?())
(flinfinite? boolean?())
(flinteger? boolean?())
(flnan? boolean?())
(flnegative? boolean?())
(flnonnegative? boolean?())
(flnonpositive? boolean?())
(flodd? boolean?())
(flonum? boolean?())
(flpositive? boolean?())
(flzero? boolean?())
(foreign-entry? boolean?())
(format-condition? boolean? (something?))
(free-identifier=? boolean?())
(fx<=? boolean?())
(fx<? boolean?())
(fx=? boolean?())
(fx>=? boolean?())
(fx>? boolean?())
(fxbit-set? boolean?())
(fxeven? boolean?())
(fxlogbit? boolean? (integer? fixnum?))
(fxnegative? boolean?())
(fxnonnegative? boolean? (fixnum?))
(fxnonpositive? boolean? (fixnum?))
(fxodd? boolean?())
(fxpositive? boolean?())
(fxvector? boolean? (something?))
(fxzero? boolean?())
(gensym? boolean? (something?))
(guardian? boolean? (something?))
(hash-table? boolean? (something?))
(hashtable-contains? boolean?())
(hashtable-ephemeron? boolean? (something?))
(hashtable-mutable? boolean?())
(hashtable-weak? boolean? (something?))
(hashtable? boolean? (something?))
(i/o-decoding-error? boolean? (something?))
(i/o-encoding-error? boolean? (something?))
(i/o-error? boolean? (something?))
(i/o-file-already-exists-error? boolean? (something?))
(i/o-file-does-not-exist-error? boolean? (something?))
(i/o-file-is-read-only-error? boolean? (something?))
(i/o-file-protection-error? boolean? (something?))
(i/o-filename-error? boolean? (something?))
(i/o-invalid-position-error? boolean? (something?))
(i/o-port-error? boolean? (something?))
(i/o-read-error? boolean? (something?))
(i/o-write-error? boolean? (something?))
(identifier? boolean? (something?))
(immutable-box? boolean? (something?))
(immutable-bytevector? boolean? (something?))
(immutable-fxvector? boolean? (something?))
(immutable-string? boolean? (something?))
(immutable-vector? boolean? (something?))
(implementation-restriction-violation? boolean? (something?))
(inexact? boolean? (number?))
(infinite? boolean? (real?))
(input-port-ready? boolean?())
(input-port? boolean? (something?))
(integer-valued? boolean? (something?))
(integer? boolean? (something?))
(interactive? boolean?())
(irritants-condition? boolean? (something?))
(lexical-violation? boolean? (something?))
(list? boolean? (something?))
(literal-identifier=? boolean?())
(locked-object? boolean? (something?))
(logbit? boolean?())
(message-condition? boolean? (something?))
(mutable-box? boolean? (something?))
(mutable-bytevector? boolean? (something?))
(mutable-fxvector? boolean? (something?))
(mutable-string? boolean? (something?))
(mutable-vector? boolean? (something?))
(mutex? boolean? (something?))
(nan? boolean? (real?))
(negative? boolean? (real?))
(no-infinities-violation? boolean? (something?))
(no-nans-violation? boolean? (something?))
(non-continuable-violation? boolean? (something?))
(nonnegative? boolean? (real?))
(nonpositive? boolean? (real?))
(not boolean? (something?))
(null? boolean? (something?))
(number? boolean?())
(odd? boolean?())
(output-port? boolean? (something?))
(pair? boolean? (something?))
(path-absolute? boolean?())
(petite? boolean?())
(port-bol? boolean?())
(port-closed? boolean?())
(port-eof? boolean?())
(port-has-port-length? boolean?())
(port-has-port-nonblocking?? boolean?())
(port-has-port-position? boolean?())
(port-has-set-port-length!? boolean?())
(port-has-set-port-nonblocking!? boolean?())
(port-has-set-port-position!? boolean?())
(port-input-empty? boolean?())
(port-nonblocking? boolean?())
(port-output-full? boolean?())
(port? boolean? (something?))
(positive? boolean? (real?))
(procedure? boolean? (something?))
(rational-valued? boolean? (something?))
(rational? boolean? (something?))
(ratnum? boolean?())
(real-valued? boolean? (something?))
(real? boolean? (something?))
(record-constructor-descriptor? boolean? (something?))
(record-field-accessible? boolean?())
(record-field-mutable? boolean?())
(record-field-mutable? boolean?())
(record-type-descriptor? boolean? (something?))
(record-type-generative? boolean?())
(record-type-opaque? boolean?())
(record-type-sealed? boolean?())
(record? boolean? (something?))
(record? boolean? (something?))
(serious-condition? boolean? (something?))
(source-condition? boolean? (something?))
(source-file-descriptor? boolean? (something?))
(source-object? boolean? (something?))
(source-table-contains? boolean? (something?))
(source-table? boolean? (something?))
(sstats? boolean? (something?))
(string-ci<=? boolean?())
(string-ci<? boolean?())
(string-ci=? boolean?())
(string-ci>=? boolean?())
(string-ci>? boolean?())
(string<=? boolean?())
(string<? boolean?())
(string=? boolean?())
(string>=? boolean?())
(string>? boolean?())
(string? boolean? (something?))
(symbol-hashtable-contains? boolean?())
(symbol-hashtable? boolean? (something?))
(symbol=? boolean?())
(symbol? boolean? (something?))
(syntax-violation? boolean? (something?))
(textual-port? boolean? (something?))
(thread-condition? boolean? (something?))
(thread? boolean? (something?))
(threaded? boolean?())
(time<=? boolean?())
(time<? boolean?())
(time=? boolean?())
(time>=? boolean?())
(time>? boolean?())
(time? boolean? (something?))
(top-level-bound? boolean?())
(top-level-bound? boolean?())
(top-level-mutable? boolean?())
(top-level-mutable? boolean?())
(top-level-syntax? boolean?())
(top-level-syntax? boolean?())
(transcoder? boolean? (something?))
(undefined-violation? boolean? (something?))
(vector? boolean? (something?))
(violation? boolean? (something?))
(warning? boolean? (something?))
(weak-pair? boolean? (something?))
(who-condition? boolean? (something?))
(zero? boolean? (number?))
(bytevector->immutable-bytevector boolean?())
(bytevector-copy boolean?())
(make-bytevector boolean?())
(make-bytevector boolean?())
(s8-list->bytevector boolean?())
(sint-list->bytevector boolean?())
(string->bytevector boolean?())
(string->utf16 boolean?())
(string->utf16 boolean?())
(string->utf32 boolean?())
(string->utf32 boolean?())
(string->utf8 boolean?())
(u8-list->bytevector boolean?())
(uint-list->bytevector boolean?())
(cfl* boolean? (cflonum? ...))
(cfl+ boolean? (cflonum? ...))
(cfl- boolean? (cflonum? **1))
(cfl-conjugate boolean? (cflonum?))
(cfl-imag-part boolean? (cflonum?))
(cfl-magnitude-squared boolean? (cflonum?))
(cfl-real-part boolean? (cflonum?))
(cfl/ boolean? (cflonum? **1))
(cfl= boolean? (cflonum? ...))
(char-downcase boolean?())
(char-foldcase boolean?())
(integer->char boolean?())
(read-char boolean?())
(read-char boolean?())
(make-compile-time-value boolean? (something?))
(make-condition boolean?())
(make-condition boolean?())
(make-i/o-decoding-error boolean? (something?))
(make-i/o-encoding-error boolean? (something? something?))
(make-i/o-error boolean? (something?))
(make-i/o-file-already-exists-error boolean?())
(make-i/o-file-does-not-exist-error boolean?())
(make-i/o-file-is-read-only-error boolean?())
(make-i/o-file-protection-error boolean?())
(make-i/o-filename-error boolean?())
(make-i/o-invalid-position-error boolean?())
(make-i/o-port-error condition? (something?))
(make-i/o-read-error condition?())
(make-i/o-write-error condition?())
(make-continuation-condition continuation-condition?())
(make-cost-center cost-center?())
(make-date date?())
(make-date date?())
(time-utc->date date?())
(time-utc->date date?())
(make-eq-hashtable eq-hashtable?())
(make-eq-hashtable eq-hashtable?())
(make-error error?())
(syntax-error error? (something? string? ...))
(inexact->exact exact? (number?))
(bytevector-ieee-double-native-ref fixnum?())
(bytevector-ieee-double-ref fixnum?())
(fx* fixnum? (fixnum? ...))
(fx* fixnum?())
(fx*/carry fixnum?())
(fx+ fixnum? (fixnum? ...))
(fx+ fixnum?())
(fx+/carry fixnum?())
(fx- fixnum? (fixnum? **1))
(fx- fixnum?())
(fx- fixnum?())
(fx-/carry fixnum?())
(fx/ fixnum? (fixnum? **1))
(fx1+ fixnum? (fixnum?))
(fx1- fixnum? (fixnum?))
(fx< fixnum? (fixnum? **1))
(fx<= fixnum? (fixnum? **1))
(fx= fixnum? (fixnum? **1))
(fx> fixnum? (fixnum? **1))
(fx>= fixnum? (fixnum? **1))
(fxabs fixnum? (fixnum?))
(fxand fixnum?())
(fxarithmetic-shift fixnum?())
(fxarithmetic-shift-left fixnum?())
(fxarithmetic-shift-right fixnum?())
(fxbit-count fixnum?())
(fxbit-field fixnum?())
(fxcopy-bit fixnum?())
(fxcopy-bit-field fixnum?())
(fxdiv fixnum?())
(fxdiv-and-mod fixnum?())
(fxdiv0 fixnum?())
(fxdiv0-and-mod0 fixnum?())
(fxfirst-bit-set fixnum?())
(fxif fixnum?())
(fxior fixnum?())
(fxlength fixnum?())
(fxlogand fixnum? (fixnum? ...))
(fxlogbit0 fixnum? (integer? fixnum?))
(fxlogbit1 fixnum? (integer? fixnum?))
(fxlogior fixnum? (fixnum? ...))
(fxlognot fixnum? (fixnum?))
(fxlogor fixnum? (fixnum? ...))
(fxlogtest fixnum? (fixnum? fixnum?))
(fxlogxor fixnum? (fixnum? ...))
(fxmax fixnum?())
(fxmin fixnum?())
(fxmod fixnum?())
(fxmod0 fixnum?())
(fxmodulo fixnum? (fixnum? fixnum?))
(fxnot fixnum?())
(fxquotient fixnum? (fixnum? **1))
(fxremainder fixnum? (fixnum? fixnum?))
(fxreverse-bit-field fixnum?())
(fxrotate-bit-field fixnum?())
(fxsll fixnum? (fixnum? integer?))
(fxsra fixnum? (fixnum? integer?))
(fxsrl fixnum? (fixnum? integer?))
(fxvector-ref fixnum?())
(fxxor fixnum?())
(greatest-fixnum fixnum?())
(least-fixnum fixnum?())
(most-negative-fixnum fixnum?())
(most-positive-fixnum fixnum?())
(bytevector-ieee-single-native-ref fixnum?())
(bytevector-ieee-single-ref fixnum?())
(fixnum->flonum fixnum?())
(fl* fixnum?())
(fl+ fixnum?())
(fl- fixnum?())
(fl- fixnum?())
(fl-make-rectangular fixnum? (fixnum? fixnum?))
(fl/ fixnum?())
(fl/ fixnum?())
(fl< fixnum? (fixnum? **1))
(fl<= fixnum? (fixnum? **1))
(fl= fixnum? (fixnum? **1))
(fl> fixnum? (fixnum? **1))
(fl>= fixnum? (fixnum? **1))
(flabs fixnum?())
(flacos fixnum?())
(flasin fixnum?())
(flatan fixnum?())
(flatan fixnum?())
(flceiling fixnum?())
(flcos fixnum?())
(fldenominator fixnum?())
(fldiv fixnum?())
(fldiv-and-mod fixnum?())
(fldiv0 fixnum?())
(fldiv0-and-mod0 fixnum?())
(flexp fixnum?())
(flexpt fixnum?())
(flfloor fixnum?())
(fllog fixnum?())
(fllog fixnum?())
(fllp fixnum? (fixnum?))
(flmax fixnum?())
(flmin fixnum?())
(flmod fixnum?())
(flmod0 fixnum?())
(flnumerator fixnum?())
(flonum->fixnum fixnum?())
(floor fixnum? (real?))
(flround fixnum?())
(flsin fixnum?())
(flsqrt flonum?())
(fltan flonum?())
(fltruncate flonum?())
(flush-output-port flonum?())
(flush-output-port flonum?())
(real->flonum flonum? (real?))
(make-format-condition format-condition?())
(fxvector fxvector? (fixnum? ...))
(fxvector-copy fxvector?())
(list->fxvector fxvector?())
(make-fxvector fxvector?())
(make-fxvector fxvector? (integer? fixnum?))
(make-guardian guadian?())
(make-eqv-hashtable hashtable?())
(make-eqv-hashtable hashtable?())
(make-hashtable hashtable?())
(make-hashtable hashtable?())
(make-hash-table hash-table?())
(make-hash-table hash-table?())
(fxvector->immutable-fxvector immutable-fxvector?())
(string->immutable-string immutable-string?())
(vector->immutable-vector immutable-vector?())
(binary-port-input-count integer?())
(binary-port-input-size integer?())
(binary-port-output-count integer?())
(binary-port-output-size integer?())
(bitwise-bit-count integer?())
(bytevector-length integer?())
(bytevector-sint-ref integer?())
(bytevector-uint-ref integer?())
(ceiling integer? (real?))
(char->integer integer?())
(compute-composition integer? (something?))
(compute-composition integer? (something? procedure?))
(compute-size integer? (something?))
(compute-size integer? (something? procedure?))
(cost-center-allocation-count integer?())
(cost-center-instruction-count integer?())
(file-position integer?())
(file-position integer?())
(fixnum-width integer?())
(foreign-sizeof integer?())
(fxvector-length integer?())
(hashtable-size integer?())
(i/o-error-position integer?())
(object-counts integer?())
(port-input-count integer?())
(port-input-size integer?())
(port-output-count integer?())
(port-output-size integer?())
(port-position integer?())
(profile-release-counters integer?())
(quotient integer?())
(real-time integer?())
(round integer? (real?))
(source-table-size integer?())
(sstats-gc-count integer?())
(symbol-hash integer?())
(textual-port-input-count integer?())
(textual-port-input-size integer?())
(textual-port-output-count integer?())
(textual-port-output-size integer?())
(vector-length integer?())
(virtual-register-count integer?())
(append list?())
(append list? (list? something?))
(bytevector->s8-list list?())
(bytevector->sint-list list?())
(bytevector->u8-list list?())
(bytevector->uint-list list?())
(fxvector->list list?())
(list list? (something? ...))
(list-copy list?())
(list-head list?())
(list-sort list?())
(list-tail list?())
(merge list?())
(oblist list?())
(sort list?())
(string->list list?())
(syntax->list list?())
(vector->list list?())
(command-line list?())
(* number? (number? ...))
(+ number? (number? ...))
(- number? (number?))
(- number? (number? number? **1))
(-1+ number? (number?))
(/ number? (number?))
(/ number? (number? number? **1))
(1+ number? (number?))
(1- number? (number?))
(abs number? (real?))
(acos number? (number?))
(acosh number? (number?))
(add1 number? (number?))
(angle number? (number?))
(asin number? (number?))
(asinh number? (number?))
(atan number? (number?))
(cos number? (number?))
(cosh number? (number?))
(log number? (number?))
(log number? (number? number?))
(magnitude number? (number?))
(magnitude-squared number? (number?))
(mod number?())
(mod0 number?())
(numerator number?())
(sin number? (number?))
(sinh number? (number?))
(sqrt number? (number?))
(string->number number?())
(string->number number?())
(sub1 number? (number?))
(tan number? (number?))
(tanh number? (number?))
(append! pair?())
(list* pair? (something? ... something?))
(i/o-error-port port?())
(lambda procedure?())
(trace-case-lambda procedure?())
(trace-lambda procedure?())
(max real? (real? real?))
(min real? (real? real?))
(random real? (real?))
(rationalize real? (real? real?))
(real-part real? (number?))
(truncate real? (real?))
(bytevector->string string?())
(i/o-error-filename string?())
(list->string string?())
(multibyte->string string? (bytevector?))
(number->string string?())
(number->string string?())
(number->string string?())
(symbol->string string?())
(utf16->string string? (bytevector?))
(utf16->string string? (bytevector?))
(utf32->string string? (bytevector?))
(utf32->string string? (bytevector?))
(utf8->string string? (bytevector?))
(string->symbol symbol?())
(file-change-time time?())
(file-change-time time?())
(file-modification-time time?())
(file-modification-time time?())
(make-time time?())
(list->vector vector?())
(syntax->vector vector?())
(vector vector? (something? ...))
(vector-copy vector?())
(vector-sort vector?())
(add-duration! void?())
(box-cas! void? (box? something? something?))
(bytevector-copy! void?())
(bytevector-fill! void?())
(bytevector-ieee-double-native-set! void?())
(bytevector-ieee-double-set! void?())
(bytevector-ieee-single-native-set! void?())
(bytevector-ieee-single-set! void?())
(bytevector-s16-native-set! void?())
(bytevector-s16-set! void?())
(bytevector-s24-set! void?())
(bytevector-s32-native-set! void?())
(bytevector-s32-set! void?())
(bytevector-s40-set! void?())
(bytevector-s48-set! void?())
(bytevector-s56-set! void?())
(bytevector-s64-native-set! void?())
(bytevector-s64-set! void?())
(bytevector-s8-set! void?())
(bytevector-sint-set! void?())
(bytevector-truncate! void?())
(bytevector-u16-native-set! void?())
(bytevector-u16-set! void?())
(bytevector-u24-set! void?())
(bytevector-u32-native-set! void?())
(bytevector-u32-set! void?())
(bytevector-u40-set! void?())
(bytevector-u48-set! void?())
(bytevector-u56-set! void?())
(bytevector-u64-native-set! void?())
(bytevector-u64-set! void?())
(bytevector-u8-set! void?())
(bytevector-uint-set! void?())
(clear-input-port void?())
(clear-input-port void?())
(clear-output-port void?())
(clear-output-port void?())
(close-input-port void?())
(close-output-port void?())
(close-port void?())
(eq-hashtable-delete! void?())
(eq-hashtable-set! void?())
(eq-hashtable-update! void?())
(foreign-set! void?())
(fxvector-fill! void? (fxvector? fixnum?))
(fxvector-set! void? (fxvector? integer? fixnum?))
(get-bytevector-n! void?())
(get-bytevector-some! void?())
(get-source-table! void?())
(get-source-table! void?())
(get-string-n! void?())
(get-string-some! void?())
(hashtable-clear! void?())
(hashtable-clear! void?())
(hashtable-delete! void?())
(hashtable-set! void?())
(hashtable-update! void?())
(load void?())
(load void?())
(load-compiled-from-port void?())
(load-library void?())
(load-library void?())
(load-program void?())
(load-program void?())
(load-shared-object void? (string?))
(mark-port-closed! void?())
(merge! void?())
(mkdir void?())
(mkdir void?())
(modulo void?())
(mutex-acquire void?())
(new-cafe void?())
(new-cafe void?())
(newline void?())
(newline void?())
(port-file-compressed! void?())
(put-char void?())
(put-datum void? (textual-output-port? something?))
(put-hash-table! void?())
(put-registry! void?())
(put-source-table void?())
(put-string void?())
(put-string void?())
(put-string void?())
(put-string-some void?())
(put-string-some void?())
(put-string-some void?())
(put-u8 void?())
(raise void? (something?))
(raise-continuable void? (something?))
(remove! void? (something? list?))
(remove-hash-table! void?())
(remove-registry! void?())
(remq! void? (something? list?))
(remv! void? (something? list?))
(reset-cost-center! void?())
(reset-maximum-memory-bytes! void?())
(reverse! void?())
(set! void?())
(set-binary-port-input-buffer! void? (binary-input-port? bytevector?))
(set-binary-port-input-index! void?())
(set-binary-port-input-size! void?())
(set-binary-port-output-buffer! void? (binary-output-port? bytevector?))
(set-binary-port-output-index! void?())
(set-binary-port-output-size! void?())
(set-box! void? (box? something? ))
(set-car! void? (pair? something?))
(set-cdr! void? (pair? something?))
(set-port-bol! void? (output-port? something?))
(set-port-eof! void? (input-port? something?))
(set-port-input-buffer! void?())
(set-port-input-index! void?())
(set-port-input-size! void?())
(set-port-length! void?())
(set-port-name! void? (port? something?))
(set-port-nonblocking! void? (port? something?))
(set-port-output-buffer! void?())
(set-port-output-index! void?())
(set-port-output-size! void?())
(set-port-position! void?())
(set-sstats-bytes! void?())
(set-sstats-cpu! void?())
(set-sstats-gc-bytes! void?())
(set-sstats-gc-count! void?())
(set-sstats-gc-cpu! void?())
(set-sstats-gc-real! void?())
(set-sstats-real! void?())
(set-textual-port-input-buffer! void?())
(set-textual-port-input-index! void?())
(set-textual-port-input-size! void?())
(set-textual-port-output-buffer! void?())
(set-textual-port-output-index! void?())
(set-textual-port-output-size! void?())
(set-time-nanosecond! void?())
(set-time-second! void?())
(set-time-type! void?())
(set-timer void?())
(set-top-level-value! void? (symbol? something? ))
(set-top-level-value! void? (symbol? something? environment?))
(set-virtual-register! void?())
(sleep void?())
(sort! void?())
(source-table-delete! void? (source-table? source-object?))
(source-table-set! void? (source-table? source-object? something?))
(string-copy! void?())
(string-fill! void?())
(string-set! void?())
(string-truncate! void?())
(subst! void?())
(substq! void?())
(substring-fill! void?())
(substv! void?())
(subtract-duration! void?())
(symbol-hashtable-delete! void?())
(symbol-hashtable-set! void?())
(symbol-hashtable-update! void?())
(time-difference! void?())
(vector-cas! void? (vector? integer? something? something?))
(vector-fill! void?())
(vector-set! void?())
(vector-set-fixnum! void?())
(vector-sort! void?())
(void void?())
(write void?())
(write void?())
(write-char void?())
(write-char void?())
)))
)