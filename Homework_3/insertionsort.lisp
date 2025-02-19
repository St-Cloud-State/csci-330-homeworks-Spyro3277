(defun insertionsort (lst)
    (processList lst)
)

(defun processList (unprocessed &optional (processed '()))
;Processes the list and then sorts the processes list

    (cond
    ((null unprocessed) 
        (append (last unprocessed) processed)
        (sort processed #'<)
        processed)
    
    (t
        (list (sort processed #'<))
        (processList (cdr unprocessed) (cons (car unprocessed) processed))
    
    )
    )

)

