<?php
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Vendors extends PublicController {

    public function run(): void
    {
        $viewData['name'] = 'Vendors';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\aboutus", $viewData);
    }
}