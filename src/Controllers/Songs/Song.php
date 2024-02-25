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
/*
Este fragmento de código PHP define una clase llamada Song dentro del espacio de nombres Controllers\Songs. Aquí está una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Songs, lo que sugiere que esta clase se encarga de la lógica relacionada con las canciones en el sistema.

Clase Song: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles solo para usuarios autenticados.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye obtener información de las canciones, verificar si la lista de canciones está vacía y renderizar la vista de la lista de canciones. */
namespace Controllers\Songs;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songs\Songs as DAOSong;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Song extends PrivateController
{
    private $id_song;
    private $title_song;
    private $duration;
    private $id_genre;
    private $song_cover;
    private $album_id;
    private $status_song;
    private $link_song;

    public function run(): void
    {
        Site::addLink('song_style');
        $viewData['id_song'] = 'id_song';
        $viewData['title_song'] = 'title_song';
        $viewData['duration'] = 'duration';
        $viewData['id_genre'] = 'id_genre';
        $viewData['song_cover'] = 'song_cover';
        $viewData['album_id'] = 'album_id';
        $viewData['status_song'] = 'status_song';
        $viewData['link_song'] = 'link_song';
        if (\Utilities\Functions::isAnEmptyArray($viewData['song'] = DAOSong::getSong())) {
            $viewData['isEmpty'] = true;
        } else {
            $viewData['isEmpty'] = false;
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("songs/songlist", $viewData);
    }
}