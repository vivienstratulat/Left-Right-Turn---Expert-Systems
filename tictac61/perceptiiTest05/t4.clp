; Percepția vehiculului și mediului înconjurător intr-o intersectie cu semne de circulatie care interzic accesul
; t4 - masina percepe drumul inainte si drumul la stanga
; semne de circulatie: interzis la stanga

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
    (percept_pobj other_road2)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj semn_interzis_stanga)
    (percept_pname isa)
    (percept_pval road_sign))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev3))

(ag_percept
    (percept_pobj other_road2)
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

(ag_percept
    (percept_pobj semn_interzis_stanga)
    (percept_pname partof)
    (percept_pval other_road2))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj other_road2)
    (percept_pname typeof)
    (percept_pval left))

(ag_percept
    (percept_pobj semn_interzis_stanga)
    (percept_pname semnifica)
    (percept_pval interzis_viraj_stanga))