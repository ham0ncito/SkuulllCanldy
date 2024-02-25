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
/*Este fragmento de código PHP define una clase llamada Playlistsongs en el espacio de nombres Controllers\Playlistsongss. Aquí hay un resumen de lo que hace esta clase:
Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Playlistsongss, lo que sugiere que esta clase maneja la lógica relacionada con las canciones de una lista de reproducción.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Playlistsongss\Playlistsongss, Utilities\Site, Utilities\Validators, Utilities\Context y Utilities\Paging.

Propiedades privadas: La clase tiene propiedades privadas que representan los datos relacionados con las canciones de la lista de reproducción, como el ID de la lista de reproducción (playlist_id), el ID de la canción (song_id), la fecha en que se agregó la canción a la lista de reproducción (playlistSong_added_at) y el estado de la canción en la lista de reproducción (playlistSong_status).

Método run(): Este método es el punto de entrada de la clase. Agrega un enlace al estilo de la lista de reproducción, prepara los datos para la vista y renderiza la plantilla playlistsongslist.

Obtención de datos de la lista de reproducción: La clase puede obtener datos de la lista de reproducción utilizando el DAO DAOPlaylistsongs::getPlaylistsongs() y los pasa a la vista para su visualización.

Validación de permisos de usuario: La clase verifica si el usuario tiene permisos de administrador antes de mostrar cierta información o realizar ciertas acciones. */
namespace Controllers\Playlistsongss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlistsongss\Playlistsongss as DAOPlaylistsongs;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Playlistsongs extends PrivateController
{
    private $playlist_id;
    private $song_id;
    private $playlistSong_added_at;
    private $playlistSong_status;

    public function run(): void
    {
        Site::addLink('playlistsongs_style');
        $viewData['playlist_id'] = 'playlist_id';
        $viewData['song_id'] = 'song_id';
        $viewData['playlistSong_added_at'] = 'playlistSong_added_at';
        $viewData['playlistSong_status'] = 'playlistSong_status';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['playlistsongs'] = DAOPlaylistsongs::getPlaylistsongs())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }


        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("playlistsongss/playlistsongslist", $viewData);
    }
}