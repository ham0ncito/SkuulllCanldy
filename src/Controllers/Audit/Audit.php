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
namespace Controllers\Audit;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/*Genera y renderizza la funcion administrativa para audiores */
class Audit extends PrivateController
{
    public function run(): void
    {
        $viewData['name'] = 'Services';  
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
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'isAUDIT'); 
        Renderer::render("admin\audit", $viewData);
    }
}