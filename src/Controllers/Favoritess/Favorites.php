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

 /*Este controlador PHP, llamado "Favorites", gestiona la funcionalidad relacionada con los favoritos de skullcanldy. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página de favoritos. Primero, agrega un enlace al archivo de estilo de favoritos. Luego, inicializa los datos de vista necesarios, como el ID del favorito, el código de usuario, el ID de referencia y el tipo de favorito.

Después, verifica si el usuario es un administrador o no. Si lo es, obtiene todos los favoritos utilizando el método getFavorites() de la clase DAOFavorites. Si el usuario no es un administrador, obtiene los favoritos específicos del usuario actual utilizando el método getFavoritesByUser() de la misma clase.

Luego, comprueba si la matriz de favoritos está vacía y establece la bandera isEmpty en consecuencia. Finalmente, agrega información sobre los roles del usuario a los datos de vista y renderiza la vista "favoritess/favoriteslist". */
namespace Controllers\Favoritess;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Favoritess\Favoritess as DAOFavorites;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Favorites extends PrivateController
{
    private $id_favorite;
    private $usercod;
    private $id_reference;
    private $type_favorite;

    public function run(): void
    {
        Site::addLink('favorites_style');
        $viewData['id_favorite'] = 'id_favorite';
        $viewData['usercod'] = 'usercod';
        $viewData['id_reference'] = 'id_reference';
        $viewData['type_favorite'] = 'type_favorite';
        
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['favorites'] = DAOFavorites::getFavorites())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
            if (\Utilities\Functions::isAnEmptyArray($viewData['purchase'] = DAOFavorites::getFavoritesByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail'])))) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        
            
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("favoritess/favoriteslist", $viewData);
    }
}