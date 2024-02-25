<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Controllers\Carretillaanons;
/*Este controlador PHP maneja las operaciones relacionadas con una carretilla de compras anónima. Permite visualizar y administrar los productos en la carretilla, incluyendo la capacidad de agregar, eliminar y actualizar productos. Utiliza un modelo de datos proporcionado por la clase `DAOCarretillaanon` para interactuar con la base de datos y obtener información sobre los productos en la carretilla. Además, gestiona la seguridad de la aplicación verificando los permisos de usuario antes de mostrar cierta funcionalidad. La vista asociada a este controlador se renderiza utilizando el motor de plantillas `Renderer`. */
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillaanons\Carretillaanons as DAOCarretillaanon;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Carretillaanon extends PrivateController
{
    private $anoncod;
    private $productId;
    private $crrctd;
    private $crrprc;
    private $crrfching;

    public function run(): void
    {
        Site::addLink('carretillaanon_style');
        $viewData['anoncod'] = 'anoncod';
        $viewData['productId'] = 'productId';
        $viewData['crrctd'] = 'crrctd';
        $viewData['crrprc'] = 'crrprc';
        $viewData['crrfching'] = 'crrfching';
        $viewData['carretillaanon'] = DAOCarretillaanon::getCarretillaanon();

        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['carretillaanon'] = DAOCarretillaanon::getCarretillaanon())) {
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
        Renderer::render("carretillaanons/carretillaanonlist", $viewData);
    }
}