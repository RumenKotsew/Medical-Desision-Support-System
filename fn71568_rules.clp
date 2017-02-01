(defrule determine-patient-data ""
    =>
    (assert (patient-first-name (ask-question "What is your first name? ")))
    (assert (patient-last-name (ask-question "What is your last name? ")))
    (assert (patient-gender (ask-question "What is your gender(male/female)? ")))
    (assert (patient-age (ask-question "What is your age? ")))
)

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

(defrule determine-disease-data ""
    => 
    (assert (symptoms (ask-for-symptom)))
)
