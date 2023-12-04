mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funciones_roles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'roles_usuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video'
]

for elemento in mi_lista:
    print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('{elemento}_DSP', 'Detalle de {elemento}', 'ACT', 'FNC');")
    print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('{elemento}_UPD', 'Editar {elemento}', 'ACT', 'FNC');")
    print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('{elemento}_DEL', 'Eliminar {elemento}', 'ACT', 'FNC');")
    print(f"INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES ('{elemento}_INS', 'Agregar {elemento}', 'ACT', 'FNC');")
