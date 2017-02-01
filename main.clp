(clear)

(load fn71568_classes.clp)
(load-instances fn71568_instances.clp)

(deftemplate symptom-disease
    (slot symptom-name)
    (slot disease-name)
)

(deffunction ask-boolean-answer-question (?question $?allowed-values)
    (printout t ?question)
    (bind ?answer (read))
    (if (lexemep ?answer)  
        then (bind ?answer (lowcase ?answer)))
    (while (not (member ?answer ?allowed-values)) do
        (printout t ?question)
        (bind ?answer (read))  
        (if (lexemep ?answer)  
            then (bind ?answer (lowcase ?answer))))
    ?answer)

(deffunction ask-question (?question)
    (printout t ?question)
    (bind ?answer (read)))


(deffunction yes-or-no-p (?question)
    (bind ?response (ask-boolean-answer-question ?question yes no y n))
    (if (or (eq ?response yes) (eq ?response y))
        then yes 
        else no))

(deffunction ask-for-symptom ()
    (printout t "What is your symptom? ")
    (bind ?answer (read))
    (bind ?diseases (filter-by-symptom-name(?answer)))
    (printout t "Found diseases: " ?diseases crlf)
)

(deffunction filter-by-symptom-name (?symptom-name)
  (bind ?list (create$))
  (do-for-all-facts (?f symptom-disease) (= ?f:symptom-name ?symptom-name)
     (bind ?list (create$ ?list ?f:disease-name)))
  return ?list)

(load fn71568_rules.clp)

(reset)
(run)
(facts)

(exit)
; (save-instances instances.clp)
