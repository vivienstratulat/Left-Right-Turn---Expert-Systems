; Percepția vehiculului și mediului înconjurător intr-o intersectie dirijata de politist / garduri
; t2 - masina percepe o intersectie in cruce dirijata de politist (considerat agent de dirijare a traficului)
; fara semne de circulatie

(ag_percept
    (percept_pobj ev2)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road2)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj politist)
    (percept_pname isa)
    (percept_pval agent))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj other_road2)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj politist)
    (percept_pname partof)
    (percept_pval ev2))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname typeof)
    (percept_pval right))

(ag_percept
    (percept_pobj other_road2)
    (percept_pname typeof)
    (percept_pval left))

(ag_percept
    (percept_pobj politist)
    (percept_pname gestures)
    (percept_pval stop))