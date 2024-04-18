; Percepția vehiculului și mediului înconjurător pe autostrada
; t2 - masina percepe doar drumul inainte, cu 2 benzi + banda de urgenta
; fara semne de circulatie, dar cu probleme tehnice

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
    (percept_pobj banda1)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda2)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda_urgenta)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj banda1)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj banda2)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj banda_urgenta)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval banda1))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval autostrada))

(ag_percept
    (percept_pobj this_car)
    (percept_pname has)
    (percept_pval problem))