<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Carretillas;
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillas\Carretillas as DAOCarretilla;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/*Este controlador PHP maneja las operaciones relacionadas con la gestión de una carretilla de compras. Permite visualizar la lista de elementos en la carretilla y proporciona funcionalidades adicionales según el rol del usuario. Utiliza la clase `DAOCarretilla` para interactuar con la base de datos y obtener la información necesaria. La seguridad del acceso se gestiona mediante la clase `Security` del espacio de nombres `Dao\Security`. La vista asociada se renderiza utilizando el motor de plantillas `Renderer`. */
class Carretilla extends PrivateController
{
    private $usercod;
    private $productId;
    private $crrctd;
    private $crrprc;
    private $crrfching;

    public function run(): void
    {
        Site::addLink('carretilla_style');
        $viewData['usercod'] = 'usercod';
        $viewData['productId'] = 'productId';
        $viewData['crrctd'] = 'crrctd';
        $viewData['crrprc'] = 'crrprc';
        $viewData['crrfching'] = 'crrfching';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['carretilla'] = DAOCarretilla::getCarretilla())) {
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
        Renderer::render("carretillas/carretillalist", $viewData);
    }
}