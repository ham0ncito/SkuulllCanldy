#this code what it does is to create insert for each rol, you gotta delete the ones you dont like rol to have
mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video'
]
roles = ['ADMIN', 'AUDIT', 'OPADQ', 'CLS', 'CLN', 'VIS', 'ART', 'DEV', 'VEN', 'INV', 'SOP'
    ]


for elemento in mi_lista:
        print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Controllers\\\{elemento.capitalize()}s\\\{elemento.capitalize()}s', 'Formulario de {elemento.capitalize()}', 'ACT', 'CTR');")
        print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Controllers\\{elemento.capitalize()}s\\\{elemento.capitalize()}', 'Lista de {elemento.capitalize()}', 'ACT', 'CTR');")
        print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('Menu_{elemento.capitalize()}', 'Menu_{elemento.capitalize()}', 'ACT', 'MNU');")
       
for elemento2 in roles:
    for elemento in mi_lista:
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', 'Controllers\\\{elemento.capitalize()}s\\\{elemento.capitalize()}s', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', 'Controllers\\\{elemento.capitalize()}s\\\{elemento.capitalize()}', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', 'Menu_{elemento.capitalize()}', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
      