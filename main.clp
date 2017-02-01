(clear)

(watch instances)

(load fn71568_classes.clp)
(load-instances fn71568_instances.clp)

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

(defrule determine-patient-data ""
    => 
    (assert (patient-first-name (ask-question "What is your first name? ")))
    (assert (patient-last-name (ask-question "What is your last name? ")))
    (assert (patient-gender (ask-question "What is your gender(male/female)? ")))
    (assert (patient-age (ask-question "What is your age? ")))
)

(defrule determine-disease-data ""
    => 
    (assert (symptoms (ask-question "What is your symptom? ")))
)

(facts)
(defrule create-patient-instance
    (patient-first-name ?pfn)
    (patient-last-name ?pln)
    (patient-age ?pa)
    (patient-gender ?pg)
    =>
    (make-instance patient of Patient
        (first_name ?pfn)
        (last_name ?pln)
        (age ?pa)
        (gender ?pg)))


(reset)
(run)
(facts)

(exit)



; (save-instances instances.clp)
