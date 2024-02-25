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
El código PHP que has proporcionado define un controlador llamado Highligthsplaylist dentro del espacio de nombres Controllers\Highligthsplaylists. Aquí tienes un resumen de su funcionalidad:


Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Highligthsplaylists, lo que sugiere que se ocupa de la gestión de listas de reproducción destacadas.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController del mismo espacio de nombres, la clase Renderer del espacio de nombres Views, así como la clase Highligthsplaylists del espacio de nombres Dao\Highligthsplaylists. Además, utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene varios atributos privados, como $highligths_id, $playlist_id y $highligths_description, que almacenan datos relacionados con las listas de reproducción destacadas.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar el controlador, recuperar los datos necesarios para la vista y renderizar la plantilla correspondiente.

Inicialización y recuperación de datos: En el método run(), se inicializan los datos necesarios para la vista, como los nombres de los atributos de las listas de reproducción destacadas, y se recupera la información de las listas de reproducción destacadas utilizando el método getHighligthsplaylist() de la clase DAOHighligthsplaylist.

Preparación de datos para la vista: Se preparan los datos necesarios para la vista, como la información de las listas de reproducción destacadas y los permisos de usuario.

Renderización de la vista: Finalmente, se renderiza la plantilla de la lista de reproducción destacada utilizando el motor de renderización Renderer y se pasan los datos preparados en el array $viewData. */
namespace Controllers\Highligthsplaylists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthsplaylists\Highligthsplaylists as DAOHighligthsplaylist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Highligthsplaylist extends PrivateController
{
    private $highligths_id;
    private $playlist_id;
    private $highligths_description;

    public function run(): void
    {
        Site::addLink('highligthsplaylist_style');
        $viewData['highligths_id'] = 'highligths_id';
        $viewData['playlist_id'] = 'playlist_id';
        $viewData['highligths_description'] = 'highligths_description';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['highligthsplaylist'] = DAOHighligthsplaylist::getHighligthsplaylist())) {
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
        Renderer::render("highligthsplaylists/highligthsplaylistlist", $viewData);
    }
}