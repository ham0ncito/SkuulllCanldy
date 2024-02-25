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
/*Este controlador PHP, llamado "Funciones", se encarga de gestionar las funciones de una aplicación web. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página de gestión de funciones. Agrega un enlace al archivo CSS correspondiente, inicializa los datos necesarios y verifica si el usuario tiene permisos de administrador. Si es un administrador, obtiene las funciones desde la base de datos y las almacena en $viewData['funciones']. Luego, renderiza la vista "funcioneslist" pasando los datos necesarios.

prepareViewData(): Este método prepara los datos necesarios para renderizar la vista. Incluye los datos de las funciones, así como información sobre si la lista de funciones está vacía y los permisos del usuario.

render(): Este método renderiza la vista "funcioneslist" utilizando el motor de renderización Renderer, pasando los datos preparados en el array $viewData. */
namespace Controllers\Funcioness;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Funciones extends PrivateController
{
    private $fncod;
    private $fndsc;
    private $fnest;
    private $fntyp;

    public function run(): void
    {
        Site::addLink('funciones_style');
        $viewData['fncod'] = 'fncod';
        $viewData['fndsc'] = 'fndsc';
        $viewData['fnest'] = 'fnest';
        $viewData['fntyp'] = 'fntyp';

        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['funciones'] = DAOFunciones::getFunciones())) {
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
        Renderer::render("funcioness/funcioneslist", $viewData);
    }
}