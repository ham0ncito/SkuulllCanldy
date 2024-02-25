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

namespace Controllers\Playlistsongss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlistsongss\Playlistsongss as DAOPlaylistsongs;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Playlistsongs extends PrivateController
{
    private $playlist_id;
    private $song_id;
    private $playlistSong_added_at;
    private $playlistSong_status;

    public function run(): void
    {
        Site::addLink('playlistsongs_style');
        $viewData['playlist_id'] = 'playlist_id';
        $viewData['song_id'] = 'song_id';
        $viewData['playlistSong_added_at'] = 'playlistSong_added_at';
        $viewData['playlistSong_status'] = 'playlistSong_status';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['playlistsongs'] = DAOPlaylistsongs::getPlaylistsongs())) {
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
        Renderer::render("playlistsongss/playlistsongslist", $viewData);
    }
}