(defun partition (lst &optional (listL '()) (listR '()))
    (cond
    ((null lst)

    (list (sort listL #'<) (sort listR #'<)))
      ((null (cdr lst))

     (list (sort listL #'<) (sort (append listR (list (car lst))) #'<)))
    (t
    
     (partition (cddr lst) (append listL (list (car lst)))(append listR (list (cadr lst))))))   
)

(defun mergesort (list)

    (let ((parts (partition list)))  
    (mergeLists (car parts) (cadr parts)))
)


(defun mergeLists (listL listR)

; Help on this section was provided by Ashmin Bhandari
  (cond

    ((null listL) listR)
    ((null listR) listL) 

    ((> (car listL) (car listR))
     (cons (car listR) (mergeLists listL (cdr listR)))) 

    (t
     (cons (car listL) (mergeLists (cdr listL) listR)))) 
)

; (load "mergesort.lisp")




