; Percepția vehiculului și mediului înconjurător la un giratoriu
; t3 - masina este pe primul sector de giratoriu, se afla pe banda 1, se face drum la dreapta (<90grade)
; unghiul de virare al masinii stabilit la max 90 grade fata de pozitia initiala

(ag_percept
    (percept_pobj ev3)
    (percept_pname isa)
    (percept_pval event))

; declarare obiecte/entitati
(ag_percept
    (percept_pobj other_road1)
    (percept_pname isa)
    (percept_pval road))

(ag_percept
    (percept_pobj this_car)
    (percept_pname isa)
    (percept_pval car))

(ag_percept
    (percept_pobj intersectie)
    (percept_pname isa)
    (percept_pval giratoriu))

(ag_percept
    (percept_pobj banda1_giratoriu)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda2_giratoriu)
    (percept_pname isa)
    (percept_pval banda))

(ag_percept
    (percept_pobj banda3_giratoriu)
    (percept_pname isa)
    (percept_pval banda))

; definire apartenente
(ag_percept
    (percept_pobj banda1_giratoriu)
    (percept_pname partof)
    (percept_pval giratoriu))

(ag_percept
    (percept_pobj banda2_giratoriu)
    (percept_pname partof)
    (percept_pval giratoriu))

(ag_percept
    (percept_pobj banda3_giratoriu)
    (percept_pname partof)
    (percept_pval giratoriu))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname partof)
    (percept_pval ev3))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval ev3))

(ag_percept
    (percept_pobj this_car)
    (percept_pname partof)
    (percept_pval banda1_giratoriu))

; definire atribute entitati
(ag_percept
    (percept_pobj banda1_giratoriu)
    (percept_pname typeof)
    (percept_pval ahead_right))

(ag_percept
    (percept_pobj banda2_giratoriu)
    (percept_pname typeof)
    (percept_pval ahead))

(ag_percept
    (percept_pobj banda3_giratoriu)
    (percept_pname typeof)
    (percept_pval ahead_left))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname typeof)
    (percept_pval right))

(ag_percept
    (percept_pobj other_road1)
    (percept_pname measures_an_angle)
    (percept_pval under_90))