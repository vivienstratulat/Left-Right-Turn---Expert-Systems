; Percepția vehiculului și mediului înconjurător la un giratoriu
; t1 - masina percepe doar drumul inainte, se afla pe banda1
; drum cu 3 benzi (inainte/stanga, inainte, inainte/dreapta)
; fara obstacole, semn de circulatie "atentie urmeaza giratoriu"

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
    (percept_pobj giratoriu1)
    (percept_pname isa)
    (percept_pval road_sign))

; definire apartenente
(ag_percept
    (percept_pobj this_road)
    (percept_pname partof)
    (percept_pval ev1))

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
    (percept_pval ev1)) 

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval banda1)) 

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
    (percept_pobj giratoriu1)
    (percept_pname semnifica)
    (percept_pval atentie_sens_giratoriu))