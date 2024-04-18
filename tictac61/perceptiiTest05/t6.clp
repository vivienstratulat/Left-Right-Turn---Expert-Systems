; Percepția vehiculului și mediului înconjurător intr-o intersectie cu semne de circulatie care interzic accesul
; t6 - masina percepe o intersectie in cruce
; semne de circulatie: inainte sau la dreapta (pana la urmatoarea intersectie)

(ag_percept
    (percept_pobj ev6)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road3)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj other_road4)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj semn_inainte_sau_la_dreapta)
    (percept_pname isa)
    (percept_pval road_sign))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev6))

(ag_percept
    (percept_pobj other_road3)
    (percept_pname partof)
    (percept_pval ev6))

(ag_percept
    (percept_pobj other_road4)
    (percept_pname partof)
    (percept_pval ev6))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev6))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj semn_inainte_sau_la_dreapta)
    (percept_pname partof)
    (percept_pval this_road))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj other_road3)
    (percept_pname typeof)
    (percept_pval right))

(ag_percept
    (percept_pobj other_road4)
    (percept_pname typeof)
    (percept_pval left))

(ag_percept
    (percept_pobj semn_inainte_sau_la_dreapta)
    (percept_pname semnifica)
    (percept_pval interzis_viraj_stanga))