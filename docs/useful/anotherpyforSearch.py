mi_lista = [
    'home', 'search'
]
roles = ['ADMIN', 'AUDIT', 'OPADQ', 'CLS', 'CLN', 'VIS', 'ART', 'DEV', 'VEN', 'INV', 'SOP'
    ]


for elemento in mi_lista:
        print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Controllers\\\{elemento.capitalize()}\\\{elemento.capitalize()}', 'Formulario de {elemento.capitalize()}', 'ACT', 'CTR');")
        print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Menu_{elemento.capitalize()}', 'Menu_{elemento.capitalize()}', 'ACT', 'MNU');")
       
for elemento2 in roles:
    for elemento in mi_lista:
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', 'Controllers\\\{elemento.capitalize()}\\\{elemento.capitalize()}', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', 'Menu_{elemento.capitalize()}', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")