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
/*
Este código PHP define un controlador llamado `Artist` en el espacio de nombres `Controllers\Artists`, el cual se encarga de manejar la lógica relacionada con los artistas. En su método `run()`, se añade un enlace de estilo para la página de artistas, se preparan los datos necesarios para la vista, y se obtienen los artistas de la base de datos utilizando el DAO correspondiente. Si no se encuentra ningún artista, se establece una bandera para indicar que la lista de artistas está vacía. Finalmente, se preparan los datos de vista relacionados con los permisos de usuario y se renderiza la plantilla de la lista de artistas.
*/

namespace Controllers\Artists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Artists\Artists as DAOArtist;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Artist extends PrivateController
{
    private $id_artist;
    private $name_artist;
    private $image_artist;
    private $date_of_birth_artist;
    private $country_artist;
    private $status_artist;
    private $artist_bio;

    public function run(): void
    {
        Site::addLink('artist_style');
        $viewData['id_artist'] = 'id_artist';
        $viewData['name_artist'] = 'name_artist';
        $viewData['image_artist'] = 'image_artist';
        $viewData['date_of_birth_artist'] = 'date_of_birth_artist';
        $viewData['country_artist'] = 'country_artist';
        $viewData['status_artist'] = 'status_artist';
        $viewData['artist_bio'] = 'artist_bio';

        if (\Utilities\Functions::isAnEmptyArray($viewData['artist'] = DAOArtist::getArtist())) {
            $viewData['isEmpty'] = True;
        } else {
            $viewData['isEmpty'] = false;
        }


        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("artists/artistlist", $viewData);
    }
}