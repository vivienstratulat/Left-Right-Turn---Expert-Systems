; Percepția vehiculului și mediului înconjurător intr-o intersectie cu strada cu acces riverani la dreapta/stanga
; t1 - masina percepe doar drumul inainte
; fara obstacole, sau semne de circulatie

(ag_percept
    (percept_pobj ev1)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev1))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev1))

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
    (percept_pobj this_road)
    (percept_pname absenta_strazi_secundare)
    (percept_pval yes))