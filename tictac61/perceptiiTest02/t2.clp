; Percepția vehiculului și mediului înconjurător intr-o intersectie cu strada infundata la stanga (are o curte in capat) / dreapta (fara posibilitate de intoarcere intr-o curte)
; t2 - masina percepe un drup la dreapta
; semne de circulatie: strada infundata

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
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj strada_infundata1)
    (percept_pname isa)
    (percept_pval road_sign))

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
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj strada_infundata1)
    (percept_pname partof)
    (percept_pval other_road1))

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
    (percept_pobj other_road1)
    (percept_pname posibilitate_intoarcere)
    (percept_pval no))

(ag_percept
    (percept_pobj strada_infundata1)
    (percept_pname semnifica)
    (percept_pval interzis_strada_infundata))
