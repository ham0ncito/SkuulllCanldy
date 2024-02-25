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

 /*Este fragmento de código PHP define una clase llamada Video dentro del espacio de nombres Controllers\Videos. Aquí hay un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Videos, lo que sugiere que forma parte de un conjunto de controladores relacionados con vídeos en la aplicación.

Clase Video: Esta clase extiende la clase PrivateController, lo que indica que probablemente se requiera autenticación para acceder a las funcionalidades relacionadas con los vídeos.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de agregar un enlace al estilo de los vídeos, luego prepara los datos de vista con nombres de campos de vídeo y verifica si hay datos de vídeo disponibles llamando a un método getVideo() en la clase DAOVideo. Luego, verifica si los datos de vídeo están vacíos y establece una bandera en consecuencia. Finalmente, prepara los datos de vista con información sobre el tipo de usuario y renderiza la vista de lista de vídeos. */

namespace Controllers\Videos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Videos\Videos as DAOVideo;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Video extends PrivateController
{
    private $id_video;
    private $title_video;
    private $description_video;
    private $duration;
    private $video_cover;
    private $artist_id;
    private $status_video;
    private $link_song;

    public function run(): void
    {
        Site::addLink('video_style');
        $viewData['id_video'] = 'id_video';
        $viewData['title_video'] = 'title_video';
        $viewData['description_video'] = 'description_video';
        $viewData['duration'] = 'duration';
        $viewData['video_cover'] = 'video_cover';
        $viewData['artist_id'] = 'artist_id';
        $viewData['status_video'] = 'status_video';
        $viewData['link_song'] = 'link_song';
        if (\Utilities\Functions::isAnEmptyArray($viewData['video'] = DAOVideo::getVideo())) {
            $viewData['isEmpty'] = true;
        } else {
            $viewData['isEmpty'] = false;
        }

        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("videos/videolist", $viewData);
    }
}