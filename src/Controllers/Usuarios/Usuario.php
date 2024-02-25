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

namespace Controllers\Usuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Usuarios\Usuarios as DAOUsuario;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Usuario extends PrivateController
{
    private $usercod;
    private $useremail;
    private $username;
    private $userpswd;
    private $userfching;
    private $userpswdest;
    private $userpswdexp;
    private $userest;
    private $useractcod;
    private $userpswdchg;
    private $usertipo;

    public function run(): void
    {
        Site::addLink('usuario_style');
        $viewData['usercod'] = 'usercod';
        $viewData['useremail'] = 'useremail';
        $viewData['username'] = 'username';
        $viewData['userpswd'] = 'userpswd';
        $viewData['userfching'] = 'userfching';
        $viewData['userpswdest'] = 'userpswdest';
        $viewData['userpswdexp'] = 'userpswdexp';
        $viewData['userest'] = 'userest';
        $viewData['useractcod'] = 'useractcod';
        $viewData['userpswdchg'] = 'userpswdchg';
        $viewData['usertipo'] = 'usertipo';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['usuario'] = DAOUsuario::getUsuario())) {
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
        Renderer::render("usuarios/usuariolist", $viewData);
    }
}