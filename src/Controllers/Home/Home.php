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

namespace Controllers\Home;
Use DAO\Artists\Artists as artists; 
use DAO\Videos\Videos AS videos;
use Dao\Albums\Albums as albums; 
use Dao\Genres\Genres as genre; 
use Controllers\PrivateController as PrivateController;

class Home extends PrivateController
{
    public function run(): void
    {
        $dataview = array();
        $dataview['artist'] = artists::gettop(); 
        $dataview['albums'] = albums::gettop();
        $dataview['videos'] = videos::gettop();
        $dataview['genre'] = genre::getGenre();
        $dataview['isCLN'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'CLN'); 
        $dataview['isCLS'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'CLS'); 
        $dataview['isADMIN'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'ADMIN'); 
        $dataview['isAUDIT'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'AUDIT');
        $dataview['lastActive'] = $_SESSION['lastActive'];

        \Views\Renderer::render("home/home", $dataview);
    }
}