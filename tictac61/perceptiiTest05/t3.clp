; Percepția vehiculului și mediului înconjurător intr-o intersectie cu semne de circulatie care interzic accesul
; t3 - intersectie libera

(ag_percept
    (percept_pobj ev3)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj intersectie_noua1)
    (percept_pname isa)
    (percept_pval intersectie))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev3))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev3))

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
    (percept_pobj intersectie_noua1)
    (percept_pname semnifica)
    (percept_pval fara_restrictii))

