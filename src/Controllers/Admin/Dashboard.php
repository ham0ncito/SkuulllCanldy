<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
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
                'url'=> 'index.php?page=Albums_Album',
            ],
            [
                'title' => 'Artist',
                'url'=> 'index.php?page=Artists_Artist',
            ], [
                'title' => 'Bitacora',
                'url'=> 'index.php?page=Bitacoras_Bitacora',
            ],
            [
                'title' => 'Caretilla',
                'url'=> 'index.php?page=Carretillas_Carretilla',
            ],
            [
                'title' => 'Caretilla Anon',
                'url'=> 'index.php?page=Carretillaanons_Carretillaanon'
            ],
            [
                'title' => 'Favorites',
                'url'=> 'index.php?page=Favoritess_Favorites',
            ],
            [
                'title' => 'Funciones',
                'url'=> 'index.php?page=Funcioness_Funciones',
            ],
            [
                'title' => 'Funciones_Roles',
                'url'=> 'index.php?page=Funcionesroless_Funcionesroles',
            ],
            [
                'title' => 'Genre',
                'url'=> 'index.php?page=Genres_Genre',
            ],
            [
                'title' => 'Highlights',
                'url'=> 'index.php?page=Highligthss_Highligths',
            ],
            [
                'title' => 'Highlights Playlist ',
                'url'=> 'index.php?page=Highligthsplaylists_Highligthsplaylist',
            ],
            [
                'title' => 'Log',
                'url'=> 'index.php?page=Logs_Log',
            ],
            [
                'title' => 'Logs Non Users',
                'url'=> 'index.php?page=Lognonusers_Lognonuser',
            ],
            [
                'title' => 'Oferts',
                'url'=> 'index.php?page=Offers_Offer',
            ],
            [
                'title' => 'Oferts Subscription',
                'url'=> 'index.php?page=Offersubscriptions_Offersubscription',
            ],
            [
                'title' => 'Playlists',
                'url'=> 'index.php?page=Playlists_Playlist',
            ],
            [
                'title' => 'Playlists Songs',
                'url'=> 'index.php?page=Playlistsongss_Playlistsongss',
            ],
            [
                'title' => 'Popularity',
                'url'=> 'index.php?page=Popularitys_Popularity',
            ],
            [
                'title' => 'Products',
                'url'=> 'index.php?page=Productss_Products',
            ],
            [
                'title' => 'Roles',
                'url'=> 'index.php?page=Roless_Roles',
            ],
            [
                'title' => 'Songs',
                'url'=> 'index.php?page=Songs_Song',
            ],
            [
                'title' => 'Song Authors',
                'url'=> 'index.php?page=Songauthorss_Songauthors',
            ],
            [
                'title' => 'Subscriptionuser',
                'url'=> 'index.php?page=Subscriptionusers_Subscriptionuser',
            ],
            [
                'title' => 'Usuario',
                'url'=> 'index.php?page=Usuarios_Usuario',
            ],
            [
                'title' => 'Video',
                'url'=> 'index.php?page=Videos_Video',
            ],
            [
                'title' => 'Roles_usuarios',
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