

roles = ['ADMIN', 'AUDIT', 'OPADQ', 'CLS', 'CLN', 'VIS', 'ART', 'DEV', 'VEN', 'INV', 'SOP'
    ]

for rol in roles: 
    if rol == "AUDIT":
        mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video'
]
        for elemento in mi_lista:
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_UPD' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_INS' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_DEL' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Menu_{elemento.capitalize()}'and rolescod = '{rol}';")
            
    if rol== 'CLN':
        mi_lista = [
    'album', 'artist', 'bitacora', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'playlist', 'playlistsongs', 'popularity', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'usuario', 'video'
]
        for elemento in mi_lista:
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_UPD' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_INS' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_DEL' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Menu_{elemento.capitalize()}'and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\{elemento.capitalize()}s\\{elemento.capitalize()}s' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\{elemento.capitalize()}s\\{elemento.capitalize()}' and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Admin\\Dashboard' and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Escupitajo\\GenerarCrud' and rolescod = '{rol}';")
    if rol== 'CLN':
        mi_lista = [
     'bitacora', 'funciones',
    'funcionesroles',  'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'roles', 'rolesusuarios',
    'subscription', 'usuario'
]
        for elemento in mi_lista:
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_UPD' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_INS' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_DEL' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Menu_{elemento.capitalize()}'and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Admin\\Dashboard' and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Escupitajo\\GenerarCrud' and rolescod = '{rol}';")
    if rol == "INV":
        mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video']
        for elemento in mi_lista:
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_UPD' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_INS' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_DEL' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Menu_{elemento.capitalize()}'and rolescod = '{rol}';")
    if rol == "INV":  
        mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video']
        for elemento in mi_lista:
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_UPD' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_INS' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='{elemento}_DEL' and rolescod = '{rol}';")
            print(f"DELETE FROM funciones_roles WHERE fncod ='Menu_{elemento.capitalize()}'and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Admin\\Dashboard' and rolescod = '{rol}';")
        print(f"DELETE FROM funciones_roles WHERE fncod ='Controllers\\Escupitajo\\GenerarCrud' and rolescod = '{rol}';")
