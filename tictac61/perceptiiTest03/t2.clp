; Percepția vehiculului și mediului înconjurător intr-o intersectie cu strada cu acces riverani la dreapta/stanga
; t2 - masina percepe un drup la dreapta
; semne de circulatie: acces riverani

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
    (percept_pobj acces_riverani1)
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
    (percept_pobj acces_riverani1)
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
    (percept_pname address)
    (percept_pval "Str. Lucian Blaga"))

(ag_percept
    (percept_pobj acces_riverani1)
    (percept_pname semnifica)
    (percept_pval permis_riverani))