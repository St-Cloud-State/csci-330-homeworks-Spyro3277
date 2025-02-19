(defun bottomsort (lst)

  (mergeList (partition lst))

)


(defun partition (lst)
;Partitions the list into adjacent sublists of two elements
(cond ((null lst) nil)  

  ((null (cdr lst)) (list lst))    
          
(t 
  (cons (sort (list (first lst) (second lst)) #'<)
    (partition (cddr lst)))))
  
)

(defun mergeList (lst)
;Merges the lists together
(cond

    ((or (null lst) (null (cdr lst))) (car lst))
    (t (mergeList (mergePass lst))))
)

(defun mergePass (lst) 
;Merge the adjacent sublists together
  (cond

    ((null lst) nil)

    ((null (cdr lst)) (list (car lst))) 

    (t (cons (mergeTwo (car lst) (cadr lst)) (mergePass (cddr lst)))))
             
)



(defun mergeTwo (listL listR)
;Merges two sublists togther
; Help on this section was provided by Ashmin Bhandari
  (cond
    ((null listL) listR)
    ((null listR) listL) 

    ((> (car listL) (car listR))

     (cons (car listR) (mergeTwo listL (cdr listR)))) 

    (t

     (cons (car listL) (mergeTwo (cdr listL) listR)))) 

)



