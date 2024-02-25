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
/*
Este archivo PHP define una clase llamada Rolesusuarios dentro del espacio de nombres Controllers\Rolesusuarioss. Aquí tienes un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Rolesusuarioss, lo que sugiere que esta clase se encarga de la lógica relacionada con los roles de usuarios.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Rolesusuarioss\Rolesusuarioss, Utilities\Site, Utilities\Validators, Utilities\Context y Utilities\Paging.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los roles de usuarios, como el código de usuario (usercod), el código de rol (rolescod), el estado del rol de usuario (roleuserest), la fecha del rol de usuario (roleuserfch) y la expiración del rol de usuario (roleuserexp).

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de agregar un enlace al estilo de los roles de usuarios, preparar los datos para la vista y renderizarla. Además, verifica si el usuario tiene el rol de administrador antes de recuperar y mostrar los roles de usuarios.

Renderizado de la vista: Utiliza el Renderer para renderizar la vista roles_usuarioss/roles_usuarioslist con los datos preparados. */
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