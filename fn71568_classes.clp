; Wed Feb 01 03:08:02 EET 2017
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
        (is-a USER)
        (role abstract)
        (single-slot KB_167620_Class9
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot first_name
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot last_name
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot age
                (type INTEGER)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot cure
                (type INSTANCE)
;+              (allowed-classes Cure)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot KB_167620_Class8
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot race
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot KB_167620_Class4
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot verbose_name
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot name_
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot gender
                (type SYMBOL)
                (allowed-values male female)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot sex
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write)))

(defclass Patient
        (is-a USER)
        (role concrete)
        (single-slot last_name
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot gender
                (type SYMBOL)
                (allowed-values male female)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot race
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot first_name
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write))
        (single-slot age
                (type INTEGER)
;+              (cardinality 0 1)
                (create-accessor read-write)))

(defclass BaseObject
        (is-a USER)
        (role abstract)
        (single-slot name_
                (type STRING)
;+              (cardinality 0 1)
                (create-accessor read-write)))

(defclass Symptoms
        (is-a BaseObject)
        (role concrete))

(defclass Disease
        (is-a BaseObject)
        (role concrete)
        (single-slot cure
                (type INSTANCE)
;+              (allowed-classes Cure)
;+              (cardinality 0 1)
                (create-accessor read-write)))

(defclass Cure
        (is-a BaseObject)
        (role concrete))
