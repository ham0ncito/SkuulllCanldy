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
/*
Este controlador PHP, llamado "Funcionesroles", se encarga de mostrar una lista de funciones relacionadas con roles de skullcanldy. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página de gestión de funciones relacionadas con roles. Inicializa los datos necesarios y verifica los permisos del usuario. Luego, recupera las funciones relacionadas con roles de la base de datos y prepara los datos para renderizar la vista correspondiente.

Preparación de datos: Se prepara un array llamado $viewData que contiene los nombres de las variables que se utilizarán en la vista, como 'rolescod', 'fncod', 'fnrolest' y 'fnexp'. También se comprueba si el usuario tiene permisos de administrador. Si es así, se recuperan las funciones relacionadas con roles de la base de datos y se establece la variable $isEmpty en true o false según si hay datos disponibles o no.

Renderización de la vista: Finalmente, se renderiza la vista "funciones_roleslist" utilizando el motor de renderización Renderer, pasando los datos preparados en el array $viewData. */
namespace Controllers\Funcionesroless;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funcionesroless\Funcionesroless as DAOFuncionesroles;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Funcionesroles extends PrivateController
{
    private $rolescod;
    private $fncod;
    private $fnrolest;
    private $fnexp;

    public function run(): void
    {
        Site::addLink('funciones_roles_style');
        $viewData['rolescod'] = 'rolescod';
        $viewData['fncod'] = 'fncod';
        $viewData['fnrolest'] = 'fnrolest';
        $viewData['fnexp'] = 'fnexp';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['funciones_roles'] = DAOFuncionesroles::getFunciones_roles())) {
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
        Renderer::render("funciones_roless/funciones_roleslist", $viewData);
    }
}