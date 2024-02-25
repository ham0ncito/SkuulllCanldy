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
Este fragmento de código PHP define una clase llamada Songauthors dentro del espacio de nombres Controllers\Songauthorss. Aquí hay una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Songauthorss, lo que sugiere que esta clase se encarga de la lógica relacionada con los autores de canciones en el sistema.

Clase Songauthors: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles solo para usuarios autenticados.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los atributos de un autor de canción, como artist_id, song_id, song_author_created_at, etc.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye agregar un enlace al estilo de los autores de canciones, obtener los datos de los autores de canciones, verificar si están vacíos y renderizar la vista correspondiente.

Renderización de la vista: Utiliza el motor de plantillas Renderer para renderizar la vista "songauthors/songauthorslist" con los datos obtenido */
namespace Controllers\Songauthorss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songauthorss\Songauthorss as DAOSongauthors;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Songauthors extends PrivateController
{
    private $artist_id;
    private $song_id;
    private $song_author_created_at;
    private $song_author_last_update_at;

    public function run(): void
    {
        Site::addLink('songauthors_style');
        $viewData['artist_id'] = 'artist_id';
        $viewData['song_id'] = 'song_id';
        $viewData['song_author_created_at'] = 'song_author_created_at';
        $viewData['song_author_last_update_at'] = 'song_author_last_update_at';


        if (\Utilities\Functions::isAnEmptyArray($viewData['songauthors'] = DAOSongauthors::getSongauthors())) {
            $viewData['isEmpty'] = true;
        } else {
            $viewData['isEmpty'] = false;
        }

        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("songauthorss/songauthorslist", $viewData);
    }
}