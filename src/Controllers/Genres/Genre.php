<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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

namespace Controllers\Genres;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Genres\Genres as DAOGenre;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/*Este código PHP define un controlador llamado Genre que se encarga de manejar los géneros de una aplicación. Aquí está su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Genres, lo que sugiere que pertenece a un conjunto de controladores relacionados con los géneros de la aplicación.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController y la clase Renderer del espacio de nombres Views, así como la clase Genre del espacio de nombres Dao\Genres. Además, utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene varios atributos privados, como $id_genre, $name_genre, $description_genre, $status_genre y $image_genre, que almacenan datos relacionados con los géneros y su gestión.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de agregar enlaces CSS, preparar los datos para la vista y renderizar la plantilla correspondiente.

Preparación de datos para la vista: El controlador prepara los datos necesarios para la vista, incluyendo los nombres de los campos, los datos de los géneros obtenidos a través de DAOGenre::getGenre() y las comprobaciones de permisos de usuario.

Renderización de la vista: Finalmente, el controlador renderiza la plantilla de lista de géneros utilizando el motor de renderización Renderer y pasa los datos preparados en el array $viewData. */
class Genre extends PrivateController
{
    private $id_genre;
    private $name_genre;
    private $description_genre;
    private $status_genre;
    private $image_genre;

    public function run(): void
    {
        Site::addLink('genre_style');
        $viewData['id_genre'] = 'id_genre';
        $viewData['name_genre'] = 'name_genre';
        $viewData['description_genre'] = 'description_genre';
        $viewData['status_genre'] = 'status_genre';
        $viewData['image_genre'] = 'image_genre';
        if (\Utilities\Functions::isAnEmptyArray($viewData['genre'] = DAOGenre::getGenre())) {
            $viewData['isEmpty'] = true;
        } else {
            $viewData['isEmpty'] = false;
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("genres/genrelist", $viewData);
    }
}