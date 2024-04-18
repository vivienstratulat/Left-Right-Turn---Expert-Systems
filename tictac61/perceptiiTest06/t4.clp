; Percepția vehiculului și mediului înconjurător intr-o intersectie dirijata de politist / garduri
; t4 - masina percepe o intersectie in cruce in care sunt inchise strazi de catre jandarmi folosind garduri (considerate obstacole)
; fara semne de circulatie

(ag_percept
    (percept_pobj ev4)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road5)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road6)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj gard1)
    (percept_pname isa)
    (percept_pval obstacol))

(ag_percept
    (percept_pobj gard2)
    (percept_pname isa)
    (percept_pval obstacol))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev4))

(ag_percept
    (percept_pobj other_road5)
    (percept_pname partof)
    (percept_pval ev4))

(ag_percept
    (percept_pobj other_road6)
    (percept_pname partof)
    (percept_pval ev4))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev4))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj other_road5)
    (percept_pname typeof)
    (percept_pval right))

(ag_percept
    (percept_pobj other_road6)
    (percept_pname typeof)
    (percept_pval left))

(ag_percept
    (percept_pobj gard1)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj gard2)
    (percept_pname typeof)
    (percept_pval right))