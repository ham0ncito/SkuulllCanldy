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