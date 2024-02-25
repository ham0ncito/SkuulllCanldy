<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/*Crea y renderiza la pagina Jobs */
class Jobs extends PublicController {

    public function run(): void
    {
        $viewData['name'] = 'Work With Us';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\jobs", $viewData);
    }
}