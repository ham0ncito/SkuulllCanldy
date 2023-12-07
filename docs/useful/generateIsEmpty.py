mi_lista = [
    'album', 'artist', 'bitacora', 'carretilla', 'carretillaanon', 'favorites', 'funciones',
    'funcionesroles', 'genre', 'highligths', 'highligthsplaylist', 'log', 'lognonuser',
    'loguser', 'offer', 'offersubscription', 'playlist', 'playlistsongs', 'popularity',
    'products', 'purchase', 'purchasedetail', 'roles', 'rolesusuarios', 'song', 'songauthors',
    'subscription', 'subscriptionuser', 'usuario', 'video'
]

roles = ['ADMIN', 'AUDIT', 'OPADQ', 'CLS', 'CLN', 'VIS', 'ART', 'DEV', 'VEN', 'INV', 'SOP']

for elemento in mi_lista:
    capitalize = elemento.capitalize()
    lower = elemento.lower()
    print("\n")
    print(f"if (\\Dao\\Security\\Security::userIs($_SESSION['useremail'], 'ADMIN')) {{"
          f"\n    if (\\Utilities\\Functions::isAnEmptyArray($viewData['{lower}'] = DAO{capitalize}::get{capitalize}())) {{"
          f"\n        $viewData['isEmpty'] = true;}}else{{ $viewData['isEmpty'] = false;}}"
          "\n} else {}")
