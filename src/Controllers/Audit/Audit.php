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
namespace Controllers\Audit;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/*Genera y renderizza la funcion administrativa para audiores */
class Audit extends PrivateController
{
    public function run(): void
    {
        $viewData['name'] = 'Services';  
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("admin\audit", $viewData);
    }
}