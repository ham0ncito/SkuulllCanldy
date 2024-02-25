<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

/*Este código PHP pertenece a un controlador llamado "Dashboard" dentro del espacio de nombres "Controllers\Admin". Su función principal es preparar datos para mostrar en el panel de administración.
Define una clase llamada "Dashboard" que extiende de "PrivateController", lo que indica que requiere autenticación para acceder.
Declara una propiedad privada llamada "$viewData" para almacenar los datos que se pasarán a la vista.
Define un método público llamado "run()" que no devuelve ningún valor.
Dentro del método "run()", se inicializa un arreglo asociativo llamado "$viewData['control']" que contiene información sobre varios elementos de control, como "Albums", "Artist", "Bitacora", etc., cada uno con un título, una URL de imagen y una URL de destino.
Además, se verifica si el usuario actual tiene ciertos roles específicos ('CLS', 'ADMIN', 'CLN') utilizando el servicio de seguridad y se almacena esta información en variables dentro de "$viewData".
Finalmente, se renderiza una vista llamada "admin/dashboard", pasando los datos preparados en "$viewData" utilizando el método estático "render()" de la clase "Renderer" del espacio de nombres "Views".
 */
namespace Controllers\Admin;

use Controllers\PrivateController;
class Dashboard extends PrivateController{
    private $viewData;
    public function run():void
    {
        
        $viewData['control'] = [
            [
                'title' => 'Albums',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Artists_Artist',
            ], [
                'title' => 'Bitacora',
                'imgUrl' => 'https://th.bing.com/th/id/R.937c02994f2cd5466a8a905af24d98d5?rik=Tpei6kM4yJYhZw&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Bitacoras_Bitacora',
            ],
            [
                'title' => 'Caretilla',
                'imgUrl' => 'https://th.bing.com/th/id/R.ccebc27ad930a411857a1d866a967d4c?rik=48ujj18Z3BZaFA&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Carretillas_Carretilla',
            ],
            [
                'title' => 'Caretilla Anon',
                'imgUrl' => 'https://th.bing.com/th/id/OIP.Ag3L6xTZW6rxy10XpD1eAwHaHP?rs=1&pid=ImgDetMain',
                'url'=> 'index.php?page=Carretillaanons_Carretillaanon'
            ],
            [
                'title' => 'Favorites',
                'imgUrl' => 'https://th.bing.com/th/id/R.4b9b7d2001285d1db52137eb9766e557?rik=uYK69uZwy8poHg&riu=http%3a%2f%2fwww.clipartbest.com%2fcliparts%2fLcK%2fzMo%2fLcKzMoBLi.png&ehk=P7i5vXvaAT%2bLbmGWhYkkqr1PyqVYM9atXOhaD7Nmd7w%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Favoritess_Favorites',
            ],
            [
                'title' => 'Funciones',
                'imgUrl' => 'https://th.bing.com/th/id/R.6444126c4ebe6fda70d9a95fffde9a98?rik=rRV001xtzYoMOw&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Funcioness_Funciones',
            ],
            [
                'title' => 'Funciones_Roles',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Funcionesroless_Funcionesroles',
            ],
            [
                'title' => 'Genre',
                'imgUrl' => 'https://th.bing.com/th/id/R.eb2c966775fbe1031ae640e3db2ded16?rik=fAT%2b9zqufbO4gQ&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Genres_Genre',
            ],
            [
                'title' => 'Highlights',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Highligthss_Highligths',
            ],
            [
                'title' => 'Highlights Playlist ',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Highligthsplaylists_Highligthsplaylist',
            ],
            [
                'title' => 'Log',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Logs_Log',
            ],
            [
                'title' => 'Logs Non Users',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Lognonusers_Lognonuser',
            ],
            [
                'title' => 'Oferts',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Offers_Offer',
            ],
            [
                'title' => 'Oferts Subscription',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Offersubscriptions_Offersubscription',
            ],
            [
                'title' => 'Playlists',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Playlists_Playlist',
            ],
            [
                'title' => 'Playlists Songs',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Playlistsongss_Playlistsongss',
            ],
            [
                'title' => 'Popularity',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Popularitys_Popularity',
            ],
            [
                'title' => 'Products',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Productss_Products',
            ],
            [
                'title' => 'Roles',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Roless_Roles',
            ],
            [
                'title' => 'Songs',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Songs_Song',
            ],
            [
                'title' => 'Song Authors',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Songauthorss_Songauthors',
            ],
            [
                'title' => 'Subscriptionuser',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Subscriptionusers_Subscriptionuser',
            ],
            [
                'title' => 'Usuario',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Usuarios_Usuario',
            ],
            [
                'title' => 'Video',
                'imgUrl' => 'https://th.bing.com/th/id/R.c132e12cb53f255033a7849da694259d?rik=4hkkFDi3ljpnFg&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Videos_Video',
            ],
            [
                'title' => 'Roles_usuarios',
                'imgUrl' => 'https://th.bing.com/th/id/R.4788de54844027461b94c17be654c1c3?rik=A%2bMXixtecmLdtA&riu=http%3a%2f%2fhiphop-n-more.com%2fwp-content%2fuploads%2f2013%2f06%2fyeezus-new-cover.jpg&ehk=8wXzlaWGoVLeCzFh3Be6bzZ%2fE4Sjxo5EB3VmtxrzRhU%3d&risl=&pid=ImgRaw&r=0',
                'url'=> 'index.php?page=Rolesusuarioss_Rolesusuarios',
            ],
           ];
           $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
           $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
           $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        \Views\Renderer::render("admin/dashboard", $viewData);
    }
}

?>