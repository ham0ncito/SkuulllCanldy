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

/*Este fragmento de código PHP define una clase llamada Playlist en el espacio de nombres Controllers\Playlists. Aquí hay un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Playlists, lo que sugiere que esta clase maneja la lógica relacionada con las listas de reproducción.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Playlists\Playlists, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene propiedades privadas que representan los datos relacionados con las listas de reproducción, como el ID de la lista de reproducción (id_playlist), el nombre de la lista de reproducción (playlist_name), la descripción de la lista de reproducción (playlist_description), etc.

Método run(): Este método es el punto de entrada de la clase. Agrega un enlace al estilo de la lista de reproducción, recupera los datos de la lista de reproducción según el tipo de usuario y los pasa a la vista para ser renderizados.

Recuperación de datos de la lista de reproducción: Dependiendo del tipo de usuario (ADMIN o no), la clase recupera las listas de reproducción adecuadas utilizando los métodos getPlaylist() o getPlaylistByUser() del DAO DAOPlaylist.

Preparación de datos para la vista: La clase prepara los datos necesarios para la vista, como los datos de la lista de reproducción, el estado de vacío (isEmpty) y los roles de usuario (isCLN, isCLS, isADMIN, isAUDIT).

Renderizado de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el Renderer y pasa los datos preparados para la vista. */

namespace Controllers\Playlists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlists\Playlists as DAOPlaylist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Playlist extends PrivateController
{
    private $id_playlist;
    private $playlist_name;
    private $playlist_description;
    private $playlist_image;
    private $playlist_create_at;
    private $playlist_status;
    private $usercod;

    public function run(): void
    {
        Site::addLink('playlist_style');
        $viewData['id_playlist'] = 'id_playlist';
        $viewData['playlist_name'] = 'playlist_name';
        $viewData['playlist_description'] = 'playlist_description';
        $viewData['playlist_image'] = 'playlist_image';
        $viewData['playlist_create_at'] = 'playlist_create_at';
        $viewData['playlist_status'] = 'playlist_status';
        $viewData['usercod'] = 'usercod';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['playlist'] = DAOPlaylist::getPlaylist()))   {
                $viewData['isEmpty'] = true; 
            }
            else{
                $viewData['isEmpty'] = false;
            }
        } else {
            if (\Utilities\Functions::isAnEmptyArray($viewData['playlist'] = DAOPlaylist::getPlaylistByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']))))   {
                $viewData['isEmpty'] = true; 
            }
            else{
                $viewData['isEmpty'] = false;
            }
            
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("playlists/playlistlist", $viewData);
    }
}