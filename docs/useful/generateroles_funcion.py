#this code what it does is to create insert for each rol, you gotta delete the ones you dont like rol to have
mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funciones_roles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'roles_usuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video'
]
roles = ['ADMIN', 'AUDIT', 'OPADQ', 'CLS', 'CLN', 'VIS', 'ART', 'DEV', 'VEN', 'INV', 'SOP'
    ]
for elemento2 in roles:
    for elemento in mi_lista:
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', '{elemento}_DSP', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', '{elemento}_UPD', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', '{elemento}_DEL', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
        print(f"INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES ('{elemento2}', '{elemento}_INS', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));")
