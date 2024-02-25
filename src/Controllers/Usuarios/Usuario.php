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
/*Este fragmento de código PHP define una clase llamada Usuario dentro del espacio de nombres Controllers\Usuarios. Aquí está una descripción de lo que hace esta clase:
Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Usuarios, lo que sugiere que forma parte de un conjunto de controladores relacionados con usuarios en la aplicación.

Clase Usuario: Esta clase extiende la clase PrivateController, lo que indica que probablemente se requiera autenticación para acceder a las funcionalidades relacionadas con los usuarios.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los campos de un usuario, como usercod, useremail, username, userpswd, entre otros.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la clase, obtener los datos de los usuarios (si el usuario actual es un administrador), preparar los datos de vista y renderizar la vista correspondiente.

Renderizado de vista: La clase utiliza el objeto Renderer para renderizar la vista usuariolist con los datos preparados. */
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