; Percepția vehiculului și mediului înconjurător intr-o intersectie cu semne de circulatie care interzic accesul
; t7 - masina trece de intersectie si are drum la stanga
; semne de circulatie:  obligatoriu inainte (pana la urmatoarea intersectie)

(ag_percept
    (percept_pobj ev7)
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
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj semn_deplasare_inainte)
    (percept_pname isa)
    (percept_pval road_sign))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev7))

(ag_percept
    (percept_pobj other_road5)
    (percept_pname partof)
    (percept_pval ev7))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev7))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj semn_deplasare_inainte)
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
    (percept_pval left))

(ag_percept
    (percept_pobj semn_deplasare_inainte)
    (percept_pname semnifica)
    (percept_pval obligatoriu_inainte))