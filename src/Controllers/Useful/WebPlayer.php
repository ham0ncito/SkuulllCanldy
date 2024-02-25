<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Controllers\Useful;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class WebPlayer extends PublicController {
 
    public function run(): void
    {
        $viewData['name'] = 'WebPlayer';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("components\webplayer", $viewData);
    }
}

  