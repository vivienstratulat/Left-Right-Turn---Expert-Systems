;
;-------Auxiliary facts ---------------------------------------
;

(defrule AGENT::initCycle-right-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-right-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited))) ;by default, we assume right-turn-maneuver NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-left-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-left-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment)  (bel_pname left-turn-maneuver) (bel_pval prohibited))) ;by default, we assume left-turn-maneuver NOT valid
    ;(facts AGENT)
)


;
;-------Auxiliary rules ---------------------------------------
;

; verificarea prezentei altor strazi pe drumul pe care se afla masina
(defrule AGENT::r-just-one-road
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval ahead))
    (ag_bel (bel_pobj ?rd) (bel_pname absenta_strazi_secundare) (bel_pval yes))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname absenta-strazi-secundare) (bel_pval yes)))
    ;(facts AGENT)
)

; verificarea prezentei unei intersectii in cruce
(defrule AGENT::r-many-roads
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rdl) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rdr) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rdl) (bel_pname typeof) (bel_pval left))
    (ag_bel (bel_pobj ?rdr) (bel_pname typeof) (bel_pval right))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname prezenta-strazi-secundare) (bel_pval yes)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Right turn
;;
;;----------------------------------


; verificarea prezentei unei strazi la dreapta pe drumul pe care se afla masina
(defrule AGENT::r-other-road-right
    (timp (valoare ?t))
    (not (ag_bel (bel_type moment) (bel_pname prezenta-strazi-secundare) (bel_pval yes)))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval ahead)))
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval right)))
    (not (ag_bel (bel_pobj ?gir) (bel_pname isa) (bel_pval giratoriu))) ;daca e in giratoriu
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))) ;daca e pe autostrada
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname absenta-strada-dreapta) (bel_pval yes)))
    ;(facts AGENT)
)


; ----------------------------
; SCENARIUL 1 : SENS GIRATORIU
; ----------------------------

(defrule AGENT::r-atentie-giratoriu-dreapta
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?ps) (bel_pname partof ) (bel_pval  ?banda ))
    (ag_bel (bel_pobj ?banda) (bel_pname isa) (bel_pval banda))
    (ag_bel (bel_pobj ?banda) (bel_pname typeof ) (bel_pval  ahead_right ))
    (ag_bel (bel_pobj ?pt) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?pt) (bel_pname semnifica) (bel_pval atentie_sens_giratoriu ))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname giratoriu-dreapta) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-giratoriu-dreapta-drum-permis
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?ps) (bel_pname typeof) (bel_pval  right))
    (ag_bel (bel_pobj ?ps) (bel_pname measures_an_angle) (bel_pval over_90))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname giratoriu-dreapta) (bel_pval yes)))
    ;(facts AGENT)
)

; ------------------------------
; SCENARIUL 2 : STRADA INFUNDATA
; ------------------------------

 ;--- Sign forbidding access on a street
(defrule AGENT::r-no-access-infundata
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval  interzis_strada_infundata))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof ) (bel_pval right))
    (ag_bel (bel_pobj ?ps) (bel_pname partof ) (bel_pval ?rd))
    (ag_bel (bel_pobj ?rd) (bel_pname posibilitate_intoarcere ) (bel_pval no))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access-infundata" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access-infundata-right) (bel_pval yes)))
   ; (facts AGENT)
)


; ----------------------------
; SCENARIUL 3 : ACCES RIVERANI
; ----------------------------

(defrule AGENT::r-no-access-riverani-right
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval permis_riverani))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval right))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?rd) (bel_pname address) (bel_pval *car-address*))

    ; Add a condition to check if the address is different from the global variable
    (ag_bel (bel_pobj ?other-rd) (bel_pname address) (bel_pval *car-address*))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access-right) (bel_pval yes)))
    ;(facts AGENT)
)


; -------------------------
; SCENARIUL 4  : AUTOSTRADA
; -------------------------


(defrule AGENT::r-highway-problem-right
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?ps) (bel_pname has) (bel_pval no_problem))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname highway-problem-right) (bel_pval yes)))
   ; (facts AGENT)
)


(defrule AGENT::r-highway-intoarcere-right
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))
    (ag_bel (bel_pobj banda1) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval banda1))
    (ag_bel (bel_pobj ?bd) (bel_pname isa) (bel_pval banda))
    (ag_bel (bel_pobj ?bd) (bel_pname typeof ) (bel_pval right))
    (ag_bel (bel_pobj ?bd) (bel_pname measures_an_angle ) (bel_pval over_90 ))
   
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname highway-intoarcere) (bel_pval yes)))
   ; (facts AGENT)
)

; -----------------------------------------------
; SCENARIUL 5 : MAI MULTE INDICATOARE CU INTERZIS
; -----------------------------------------------

;--- Sign forbidding right turn or forcing either go ahead or left turn
(defrule AGENT::r-no-right-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval ?v&interzis_viraj_dreapta | obligatoriu_inainte | obligatoriu_stanga | obligatoriu_inainte_stanga))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-sign" crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-right-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval intersectie))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval fara_restrictii))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)


; ----------------------------------------
; SCENARIUL 6 : DIRIJARE POLITIE & GARDURI
; ----------------------------------------

(defrule AGENT::r-policeman-forbidden-right
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval agent))
    (ag_bel (bel_pobj ?ps) (bel_pname gestures) (bel_pval ?pd& stop | left ))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname policeman-forbidden-right) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-policeman-guard-right
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval obstacol))
    (ag_bel (bel_pobj ?ps) (bel_pname typeof ) (bel_pval right ))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname policeman-guard-right) (bel_pval yes)))
    ;(facts AGENT)
)


; ----------
; VALIDATION
; ----------

;-----Validate intention of right-turn: check if there is any restriction ----------
(defrule AGENT::validate-right-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname absenta_strazi_secundare) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname absenta-strada-dreapta) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname giratoriu-dreapta) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname no-access-right) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname no-access-infundata-right) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname policeman-forbidden-right) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname policeman-guard-right) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname highway-problem-right) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname highway-intoarcere) (bel_pval yes)))
  
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-right-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Left turn
;;
;;----------------------------------

; verificarea prezentei unei strazi la stanga pe drumul pe care se afla masina
(defrule AGENT::r-other-road-left
    (timp (valoare ?t))
    (not (ag_bel (bel_type moment) (bel_pname prezenta-strazi-secundare) (bel_pval yes)))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval ahead)))
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval left)))
    (not (ag_bel (bel_pobj ?gir) (bel_pname isa) (bel_pval giratoriu))) ;daca e in giratoriu
    (not (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))) ;daca e pe autostrada

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname absenta-strada-stanga) (bel_pval yes)))
    ;(facts AGENT)
)


; ----------------------------
; SCENARIUL 1 : SENS GIRATORIU
; ----------------------------

(defrule AGENT::r-atentie-giratoriu-stanga
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?ps) (bel_pname partof ) (bel_pval  ?banda ))
    (ag_bel (bel_pobj ?banda) (bel_pname isa) (bel_pval banda))
    (ag_bel (bel_pobj ?banda) (bel_pname typeof ) (bel_pval  ahead_left ))
    (ag_bel (bel_pobj ?pt) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?pt) (bel_pname semnifica) (bel_pval atentie_sens_giratoriu ))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname giratoriu-stanga) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-giratoriu-stanga
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?pt) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?pt) (bel_pname semnifica) (bel_pval sens_giratoriu ))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname giratoriu-stanga) (bel_pval yes)))
    ;(facts AGENT)
)


; ------------------------------
; SCENARIUL 2 : STRADA INFUNDATA
; ------------------------------

(defrule AGENT::r-no-access-infundata-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval  interzis_strada_infundata))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof ) (bel_pval left))
    (ag_bel (bel_pobj ?ps) (bel_pname partof ) (bel_pval ?rd))
    (ag_bel (bel_pobj ?rd) (bel_pname posibilitate_intoarcere ) (bel_pval no))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access-infundata" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access-infundata-left) (bel_pval yes)))
   ; (facts AGENT)
)



; ----------------------------
; SCENARIUL 3 : ACCES RIVERANI
; ----------------------------


(defrule AGENT::r-no-access-riverani-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval permis_riverani))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval left))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval ?rd))
    ;(not (ag_bel (bel_pobj ?rd) (bel_pname address) (bel_pval ?*car-address*)))
    (ag_bel (bel_pobj ?rd) (bel_pname address) (bel_pval ?addr))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access left" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access-left) (bel_pval yes)))
    ;(facts AGENT)
)


; ------------------------
; SCENARIUL 4 : AUTOSTRADA
; ------------------------


(defrule AGENT::r-highway-problem-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?ps) (bel_pname has) (bel_pval problem))

=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname highway-problem-left) (bel_pval yes)))
   ; (facts AGENT)
)


(defrule AGENT::r-highway-obstacol-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof) (bel_pval autostrada))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj banda1) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj banda2) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval banda1))
    (ag_bel (bel_pobj ?ob) (bel_pname isa) (bel_pval obstacol))
    (ag_bel (bel_pobj ?ob) (bel_pname partof ) (bel_pval banda2 ))
   
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname highway-obstacol-left) (bel_pval yes)))
   ; (facts AGENT)
)

; daca masina se afla pe banda 2 nu are voie sa vireze la stanga
(defrule AGENT::r-highway-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_pobj ?rd) (bel_pname isa) (bel_pval road))
    (ag_bel (bel_pobj ?rd) (bel_pname typeof ) (bel_pval autostrada))
    (ag_bel (bel_pobj banda2) (bel_pname partof) (bel_pval ?rd))
    (ag_bel (bel_pobj ?ps) (bel_pname partof) (bel_pval banda2))
   
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname highway-left) (bel_pval yes)))
   ; (facts AGENT)
)



; -----------------------------------------------
; SCENARIUL 5 : MAI MULTE INDICATOARE CU INTERZIS
; -----------------------------------------------

;--- Sign forbidding left turn or forcing either go ahead or right turn
(defrule AGENT::r-no-left-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval ?v&interzis_viraj_stanga | obligatoriu_inainte  ))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-sign" ?v crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-left-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval intersectie))
    (ag_bel (bel_pobj ?ps) (bel_pname semnifica) (bel_pval fara_restrictii))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)



; ------------------------------
; SCENARIUL 6 : DIRIJARE POLITIE
; ------------------------------

(defrule AGENT::r-policeman-forbidden-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval agent))
    (ag_bel (bel_pobj ?ps) (bel_pname gestures) (bel_pval ?pd& stop | right ))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname policeman-forbidden-left) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-policeman-guard-left
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval obstacol))
      (ag_bel (bel_pobj ?ps) (bel_pname typeof ) (bel_pval left ))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname policeman-guard-left) (bel_pval yes)))
    ;(facts AGENT)
)


; ----------
; VALIDATION
; ----------


;-----Validate intention of left-turn: check if there is any restriction ----------
(defrule AGENT::validate-left-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname absenta_strazi_secundare) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname absenta-strada-stanga) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname giratoriu-stanga) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname policeman-forbidden-left) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname policeman-guard-left) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname highway-left) (bel_pval yes))) 
    (not (ag_bel (bel_type moment) (bel_pname highway-obstacol-left) (bel_pval yes)))  
    (not (ag_bel (bel_type moment) (bel_pname highway-problem-left) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname no-access-infundata-left) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname no-access-left) (bel_pval yes)))
   
;roundabout
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-left-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)




;---------Delete auxiliary facts which are no longer needed ----------
;
; Programmner's task
;
