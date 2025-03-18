; I → iEI’, I’ → S | SeS, E → GE’, E’ → oGE’ | ε, G → x|y|z|w, 
; S → s|dLb, L → sL’, L’ → L | ε

(defun parseI (str)
(print '( in parse_I)) (print str)

(cond ((eql (car str) 'i) (parseIprime (parseE (cdr str))))

(t 
    '(err)
)
)

)


(defun parseE (str)

(print '( in parse_E)) (print str)

(parseEprime (parseG str))


)

(defun parseG (str)

(print '( in parse_G)) (print str)
(cond
    ((member (car str) '(x y z w)) (cdr str))
    (t
         '(err)
    )
)

)

(defun parseEprime (str)
(print '( in parse_E_prime)) (print str)
(cond

    ((null str) str)
     ((eql (car str) 'o) (parseEprime (parseG (cdr str))))
    
    (t
        str
    )
)

)

(defun parseIprime (str)
(print '( in parse_I_prime)) (print str)
(cond
    ((and (not (null str)) (eql (car str) 'e))  
     (parseS (cdr str)))
    (t 
    (parseS str))
)
)

(defun parseS (str)
(print '( in parse_S)) (print str)
(cond 
    ((null str) '(err))
    ((eql (car str) 's) (cdr str))
    ((eql (car str) 'd) (parseL (cdr str))
    
    )
    (t
        '(err)
    )

)

)

(defun parseL (str)

(print '( in parse_L)) (print str)

(cond 
((eql (car str) 's) (parseLprime (cdr str)))

    (t
        (cdr str)
    )

)
)

(defun parseLprime (str)
(print '( in parse_L_prime)) (print str)

(cond
    ((null str) str)  
    (t 
    
    (parseL (cdr str)))
  )


)

;   (load "parser.lisp")









