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

/*Este archivo PHP define una clase llamada Roles dentro del espacio de nombres Controllers\Roless. Aquí tienes un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Roless, lo que sugiere que esta clase se encarga de la lógica relacionada con los roles.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Roless\Roless, Utilities\Site, Utilities\Validators, Utilities\Context y Utilities\Paging.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los roles, como el código de rol (rolescod), la descripción del rol (rolesdsc) y el estado del rol (rolesest).

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de agregar un enlace al estilo de los roles, preparar los datos para la vista y renderizarla. Además, verifica si el usuario tiene el rol de administrador antes de recuperar y mostrar los roles.

Renderizado de la vista: Utiliza el Renderer para renderizar la vista roless/roleslist con los datos preparados. */

namespace Controllers\Roless;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Roless\Roless as DAORoles;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Roles extends PrivateController
{
    private $rolescod;
    private $rolesdsc;
    private $rolesest;

    public function run(): void
    {
        Site::addLink('roles_style');
        $viewData['rolescod'] = 'rolescod';
        $viewData['rolesdsc'] = 'rolesdsc';
        $viewData['rolesest'] = 'rolesest';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['roles'] = DAORoles::getRoles())) {
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
        Renderer::render("roless/roleslist", $viewData);
    }
}