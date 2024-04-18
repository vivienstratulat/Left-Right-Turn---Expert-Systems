; Percepția vehiculului și mediului înconjurător la un giratoriu
; t2 - masina percepe un giratoriu (consideram semn de circulatie care anunta intrarea in giratoriu), se afla pe banda 1

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
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj banda1)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda2)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda3)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj giratoriu2)
    (percept_pname isa)
    (percept_pval road_sign))

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
    (percept_pobj banda3)
    (percept_pname partof)
    (percept_pval this_road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev2))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval banda1))

(ag_percept
    (percept_pobj giratoriu)
    (percept_pname partof)
    (percept_pval ev2))

; definire atribute entitati
(ag_percept
    (percept_pobj this_road)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj banda1)
    (percept_pname typeof)
    (percept_pval ahead_right))

(ag_percept
    (percept_pobj banda2)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj banda3)
    (percept_pname typeof)
    (percept_pval ahead_left))

(ag_percept
    (percept_pobj giratoriu2)
    (percept_pname semnifica)
    (percept_pval sens_giratoriu))