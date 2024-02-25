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
namespace Controllers\Albums;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Albums\Albums as DAOAlbum;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

/**
 * Clase controladora para la gestión de álbumes en el espacio de nombres "Controllers\Albums".
 */
class Album extends PrivateController
{
    // Propiedades para almacenar información del álbum
    private $id_album;
    private $title_album;
    private $image_album;
    private $release_date_album;
    private $number_of_songs_album;
    private $id_artist;
    private $status_album;
    private $id_genre;

    /**
     * Método principal para ejecutar la lógica de la página.
     */
    public function run(): void
    {
        // Agregar un enlace de estilo específico para la página de álbumes
        Site::addLink('album_style');
        
        // Definir las claves para los datos que se pasarán a la vista
        $viewData['id_album'] = 'id_album';
        $viewData['title_album'] = 'title_album';
        $viewData['image_album'] = 'image_album';
        $viewData['release_date_album'] = 'release_date_album';
        $viewData['number_of_songs_album'] = 'number_of_songs_album';
        $viewData['id_artist'] = 'id_artist';
        $viewData['status_album'] = 'status_album';
        $viewData['id_genre'] = 'id_genre';

        // Obtener los datos del álbum desde la capa de acceso a datos
        if (\Utilities\Functions::isAnEmptyArray($viewData['album'] = DAOAlbum::getAlbum())) {
            $viewData['isEmpty'] = True;
        } {
            $viewData['isEmpty'] = false;
        }

        // Verificar los roles del usuario actual y almacenar la información en la vista
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        
        // Renderizar la vista de lista de álbumes con los datos preparados
        Renderer::render("albums/albumlist", $viewData);
    }
}
?>
```