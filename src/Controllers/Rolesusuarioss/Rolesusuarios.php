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

namespace Controllers\Rolesusuarioss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Rolesusuarioss\Rolesusuarioss as DAORoles_usuarios;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Rolesusuarios extends PrivateController
{
    private $usercod;
    private $rolescod;
    private $roleuserest;
    private $roleuserfch;
    private $roleuserexp;

    public function run(): void
    {
        Site::addLink('roles_usuarios_style');
        $viewData['usercod'] = 'usercod';
        $viewData['rolescod'] = 'rolescod';
        $viewData['roleuserest'] = 'roleuserest';
        $viewData['roleuserfch'] = 'roleuserfch';
        $viewData['roleuserexp'] = 'roleuserexp';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['roles_usuarios'] = DAORoles_usuarios::getRoles_usuarios())) {
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
        Renderer::render("roles_usuarioss/roles_usuarioslist", $viewData);
    }
}