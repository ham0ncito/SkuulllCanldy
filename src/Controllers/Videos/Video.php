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