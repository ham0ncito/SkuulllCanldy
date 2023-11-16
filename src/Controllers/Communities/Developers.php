<?php
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Developers extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'Developers';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\aboutus", $viewData);
    }
}

  